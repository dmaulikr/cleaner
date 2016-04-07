#import "mareadustitem.h"

static CGFloat const maxspeed = 5;
static NSUInteger const minspeed = 1;

@implementation mareadustitem
{
    CGFloat x;
    CGFloat y;
    CGFloat minx;
    CGFloat maxx;
    CGFloat miny;
    NSUInteger speed;
    NSUInteger speedcounter;
    NSUInteger direction;
}

-(instancetype)init:(mareadust*)model x:(CGFloat)newx y:(CGFloat)newy
{
    self = [super init];
    self.model = model;
    self.spatial = [[gareadust alloc] init:model.modelarea.modeltextures];
    self.spatial.x = x = newx;
    self.spatial.y = y = newy;
    miny = - self.spatial.height;
    minx = - self.spatial.width;
    maxx = self.model.modelarea.screenwidth;
    [self.spatial rasterize];
    speedcounter = 0;
    speed = arc4random_uniform(maxspeed) + minspeed;
    direction = arc4random_uniform(3.0) - 1.0;
 
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
    speedcounter++;
    
    if(speedcounter > speed)
    {
        BOOL remove = NO;
        speedcounter = 0;
        x += direction;
        y--;
        
        if(y < miny)
        {
            remove = YES;
        }
        else if(x < minx)
        {
            remove = YES;
        }
        else if(x > maxx)
        {
            remove = YES;
        }
        
        if(remove)
        {
            [self.model.items removeObject:self];
        }
        else
        {
            self.spatial.x = x;
            self.spatial.y = y;
            [self.spatial render];
        }
    }
}

@end