#import "mgun.h"

static NSInteger const gunsize = 40;
static NSInteger const fingersize = 120;
static NSInteger const caliber = 5;
static NSInteger const deltamargin = 5;
static NSInteger const shootspeed = 4;
static NSInteger const wavesmaxttl = 3;

@implementation mgun
{
    __weak vgamehub *hub;
    mgunwaves *modelwaves;
    ggun *spatialtarget;
    ggun *spatialpointer;
    ggun *spatialfingera;
    ggun *spatialfingerb;
    NSInteger gunsize_2;
    NSInteger fingersize_2;
    NSInteger pointermargin;
    NSInteger shootcurrent;
    NSInteger xa;
    NSInteger ya;
    NSInteger xb;
    NSInteger yb;
    NSInteger wavesttl;
}

-(instancetype)init
{
    self = [super init];
    gunsize_2 = gunsize / 2;
    fingersize_2 = fingersize / 2;
    pointermargin = gunsize_2 - deltamargin;
    shootcurrent = 0;
    wavesttl = 0;
    spatialpointer = [[ggun alloc] init:[mtextures singleton].textures_gunpointer width:gunsize height:gunsize];
    spatialtarget = [[ggun alloc] init:[mtextures singleton].textures_guntarget width:gunsize height:gunsize];
    spatialfingera = [[ggun alloc] init:[mtextures singleton].textures_gunfinger width:fingersize height:fingersize];
    spatialfingerb = [[ggun alloc] init:[mtextures singleton].textures_gunfinger width:fingersize height:fingersize];
    modelwaves = [[mgunwaves alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedglkmove:(NSNotification*)notification
{
    if(self.touchstart)
    {
        CGPoint pointstart = [self.touchstart locationInView:hub];
        xa = pointstart.x;
        ya = pointstart.y;
        
        NSInteger x = xa - fingersize_2;
        NSInteger y = ya - fingersize_2;
        NSInteger dx = x - spatialfingera.x;
        NSInteger dy = y - spatialfingera.y;
        
        spatialfingera.x = x;
        spatialfingera.y = y;
        
        [spatialfingera updateprojection:dx dy:dy];
        [spatialfingera makeactive];
        [spatialfingera movetotop];
    }
    
    if(self.touchend)
    {
        CGPoint pointend = [self.touchend locationInView:hub];
        xb = pointend.x;
        yb = pointend.y;
        
        NSInteger x = xb - fingersize_2;
        NSInteger y = yb - fingersize_2;
        NSInteger dx = x - spatialfingerb.x;
        NSInteger dy = y - spatialfingerb.y;
        
        spatialfingerb.x = x;
        spatialfingerb.y = y;
        
        [spatialfingerb updateprojection:dx dy:dy];
        [spatialfingerb makeactive];
        [spatialfingerb movetotop];
        
        if(wavesttl)
        {
            wavesttl--;
        }
        else
        {
            wavesttl = wavesmaxttl;
            
            if(self.touchstart)
            {
                NSInteger deltax = xa - xb;
                NSInteger deltay = ya - yb;
                NSInteger deltax_2 = deltax / 2;
                NSInteger deltay_2 = deltay / 2;
                NSInteger x = xa - deltax_2;
                NSInteger y = ya - deltay_2;
                
                [modelwaves restart:xa inity:ya centerx:x centery:y finalx:xb finaly:yb pointermargin:pointermargin];
                [self centerx:x y:y];
            }
        }
    }
}

#pragma mark functionality

-(void)centerx:(NSInteger)x y:(NSInteger)y
{
    shootcurrent++;
    
    NSInteger initialx = x - gunsize_2;
    NSInteger initialy = y - gunsize_2;
    NSInteger finalx = x + gunsize_2;
    NSInteger finaly = y + gunsize_2;
    NSInteger dx = initialx - spatialpointer.x;
    NSInteger dy = initialy - spatialpointer.y;
    
    spatialpointer.x = initialx;
    spatialpointer.y = initialy;
    spatialtarget.x = initialx;
    spatialtarget.y = initialy;
    
    [spatialpointer updateprojection:dx dy:dy];
    [spatialtarget updateprojection:dx dy:dy];
    
    [spatialpointer makeactive];
    [spatialtarget makeactive];
    
    if(shootcurrent > shootspeed)
    {
        shootcurrent = 0;
        mgunshot *gunshot = [[mgunshot alloc] init:caliber minx:initialx miny:initialy maxx:finalx maxy:finaly];
        [spatialtarget movetotop];
        [spatialpointer movetotop];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:notification_gunshot object:nil userInfo:gunshot];
    }
}

#pragma mark public

-(void)clearloop
{
    wavesttl = 0;
    shootcurrent = 0;
    [spatialtarget deactivate];
    [spatialpointer deactivate];
    [spatialfingera deactivate];
    [spatialfingerb deactivate];
    
    [modelwaves clear];
}

-(void)receivehub:(vgamehub*)newhub
{
    hub = newhub;
}

@end