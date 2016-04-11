#import "mtrapitem.h"
#import "appdel.h"

static NSUInteger const maxspeed = 10;
static NSUInteger const minspeed = 0;

@implementation mtrapitem
{
    gtrap *spatial;
    NSInteger x;
    NSInteger y;
    NSUInteger speed;
    NSUInteger speedcounter;
}

-(instancetype)init:(mtrap*)model x:(NSInteger)newx
{
    self = [super init];
    self.model = model;
    x = newx;
    speed = arc4random_uniform(maxspeed) + minspeed;
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedgunshot:(NSNotification*)notification
{
    mgunshot *gunshot = (mgunshot*)notification.userInfo;
    
    if(x < gunshot.maxx)
    {
        if(x + trapwidth > gunshot.minx)
        {
            if(y < gunshot.maxy)
            {
                if(y + trapheight > gunshot.miny)
                {
                    [self gunshot:gunshot.caliber];
                }
            }
        }
    }
}

-(void)notifiedglkmove:(NSNotification*)notification
{
    speedcounter++;
    
    if(speedcounter > speed)
    {
        y++;
        
        if(y > trapmaxy)
        {
            [self die:NO];
        }
        else
        {
            speedcounter = 0;
            [spatial updateprojection:0 dy:1];
        }
    }
}

#pragma mark functionality

-(void)gunshot:(NSInteger)caliber
{
    CGFloat centerx = x + foewidth_2;
    CGFloat centery = y + foeheight_2;
    
    [self.model.modeleffect shotatx:centerx y:centery];
}

-(void)die:(BOOL)points
{
    [self.model.items removeObject:self];
}

#pragma mark public

-(void)spatial:(NSArray<NSNumber*>*)textures
{
    y = -foeheight;
    spatial = [[gtrap alloc] init:textures x:x y:y];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedgunshot:) name:notification_gunshot object:nil];
}

@end