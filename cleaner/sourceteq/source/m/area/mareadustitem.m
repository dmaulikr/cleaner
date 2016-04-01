#import "mareadustitem.h"

static CGFloat const maxspeed = 40;
static NSUInteger const minspeed = 2;

@implementation mareadustitem
{
    NSUInteger speed;
    NSUInteger speedcounter;
    NSUInteger direction;
}

-(instancetype)init:(mareadust*)model x:(CGFloat)x y:(CGFloat)y
{
    self = [super init];
    self.model = model;
    self.spatial = [[gareadust alloc] init];
    self.spatial.x = x;
    self.spatial.y = y;
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
        self.spatial.x += direction;
        self.spatial.y -= 1;
        self.spatial.repos = YES;
        
        if(self.spatial.y < - self.spatial.height)
        {
            remove = YES;
        }
        else if(self.spatial.x < - self.spatial.width)
        {
            remove = YES;
        }
        else if(self.spatial.x > self.model.modelarea.screenwidth)
        {
            remove = YES;
        }
        
        if(remove)
        {
            [self.model.items removeObject:self];
        }
    }
}

@end