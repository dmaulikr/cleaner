#import "mgun.h"

static NSInteger const gunsize = 40;
static NSInteger const fingersize = 120;
static NSInteger const caliber = 5;
static NSInteger const deltamargin = 5;
static NSInteger const shootspeed = 20;

@implementation mgun
{
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
    self.spatialpointer = [[ggun alloc] init:[mtextures singleton].textures_gunpointer width:gunsize height:gunsize];
    self.spatialtarget = [[ggun alloc] init:[mtextures singleton].textures_guntarget width:gunsize height:gunsize];
    self.spatialfingera = [[ggun alloc] init:[mtextures singleton].textures_gunfinger width:fingersize height:fingersize];
    self.spatialfingerb = [[ggun alloc] init:[mtextures singleton].textures_gunfinger width:fingersize height:fingersize];
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
    CGPoint pointstart = [self.touchstart locationInView:self.hub];
    CGPoint pointend = [self.touchend locationInView:self.hub];
    CGFloat xa = pointstart.x;
    CGFloat ya = pointstart.y;
    CGFloat xb = pointend.x;
    CGFloat yb = pointend.y;
    
    if(self.touchstart)
    {
        NSInteger x = xa - fingersize_2;
        NSInteger y = ya - fingersize_2;
        
        [self.fingera initialx:x y:y width:fingersize height:fingersize];
    }
    
    if(self.touchend)
    {
        NSInteger x = xb - fingersize_2;
        NSInteger y = yb - fingersize_2;
        
        [self.fingerb initialx:x y:y width:fingersize height:fingersize];
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
    NSInteger initialx = x - gunsize_2;
    NSInteger initialy = y - gunsize_2;
    NSInteger finalx = x + gunsize_2;
    NSInteger finaly = y + gunsize_2;
    
    [self.spatialpointer initialx:initialx y:initialy width:gunsize height:gunsize];
    [self.spatialtarget initialx:initialx y:initialy width:gunsize height:gunsize];
    
    shootcurrent++;
    
    if(shootcurrent > shootspeed)
    {
        shootcurrent = 0;
        mgunshot *gunshot = [[mgunshot alloc] init:caliber minx:initialx miny:initialy maxx:finalx maxy:finaly];
        [[NSNotificationCenter defaultCenter] postNotificationName:notification_gunshot object:nil userInfo:gunshot];
    }
}

#pragma mark public

-(void)clearloop
{
    shootcurrent = 0;
    self.spatialtarget.active = NO;
    self.spatialpointer.active = NO;
    self.fingera.active = NO;
    self.fingerb.active = NO;
    [self.modelwaves clear];
}

@end