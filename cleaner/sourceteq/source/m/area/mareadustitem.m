#import "mareadustitem.h"

static CGFloat const maxspeed = 10;
static NSUInteger const minspeed = 1;
static NSUInteger const dustsize = 11;

@implementation mareadustitem
{
    gareadust *spatial;
    NSInteger x;
    NSInteger y;
    NSInteger minx;
    NSInteger maxx;
    NSInteger miny;
    NSUInteger speed;
    NSUInteger speedcounter;
    NSUInteger direction;
}

-(instancetype)init:(mareadust*)model x:(NSInteger)newx y:(NSInteger)newy
{
    self = [super init];
    self.model = model;
    x = newx;
    y = newy;
    miny = - dustsize;
    minx = - dustsize;
    maxx = screenwidth;
    speedcounter = 0;
    speed = arc4random_uniform(maxspeed) + minspeed;
    direction = arc4random_uniform(3.0) - 1.0;
    spatial = [[gareadust alloc] init:x y:y size:dustsize];
 
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
            [spatial updateprojection:direction dy:-1];
        }
    }
}

@end