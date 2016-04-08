#import "mgun.h"

static NSInteger const gunsize = 40;
static NSInteger const fingersize = 120;
static NSInteger const caliber = 5;
static NSInteger const deltamargin = 5;
static NSInteger const shootspeed = 20;

@implementation mgun
{
    __weak vgamehub *hub;
    ggun *spatialtarget;
    ggun *spatialpointer;
    ggun *spatialfingera;
    ggun *spatialfingerb;
    NSInteger gunsize_2;
    NSInteger fingersize_2;
    NSInteger shootcurrent;
}

-(instancetype)init
{
    self = [super init];
    gunsize_2 = gunsize / 2.0;
    fingersize_2 = fingersize / 2.0;
    shootcurrent = 0;
    spatialpointer = [[ggun alloc] init:[mtextures singleton].textures_gunpointer width:gunsize height:gunsize];
    spatialtarget = [[ggun alloc] init:[mtextures singleton].textures_guntarget width:gunsize height:gunsize];
    spatialfingera = [[ggun alloc] init:[mtextures singleton].textures_gunfinger width:fingersize height:fingersize];
    spatialfingerb = [[ggun alloc] init:[mtextures singleton].textures_gunfinger width:fingersize height:fingersize];
    self.modelwaves = [[mgunwaves alloc] init];
    
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
    CGFloat xa = 0;
    CGFloat ya = 0;
    CGFloat xb = 0;
    CGFloat yb = 0;
    
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
    }
    
    if(self.touchstart && self.touchend)
    {
        CGFloat deltax = xa - xb;
        CGFloat deltay = ya - yb;
        CGFloat deltax_2 = deltax / 2.0;
        CGFloat deltay_2 = deltay / 2.0;
        NSInteger x = roundf(xa - deltax_2);
        NSInteger y = roundf(ya - deltay_2);
        
        [self.modelwaves restart:xa inity:ya centerx:x centery:y finalx:xb finaly:yb pointermargin:gunsize_2 - deltamargin];
        [self centerx:x y:y];
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
    shootcurrent = 0;
    [spatialtarget deactivate];
    [spatialpointer deactivate];
    [spatialfingera deactivate];
    [spatialfingerb deactivate];
    [self.modelwaves clear];
}

-(void)receivehub:(vgamehub*)newhub
{
    hub = newhub;
}

@end