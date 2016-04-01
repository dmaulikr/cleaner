#import "mareadustitem.h"

static CGFloat const moveratio = 10;
static NSUInteger const speed = 3;

@implementation mareadustitem
{
    NSUInteger speedcounter;
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
 
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    NSLog(@"dealloced dust");
}

#pragma mark notified

-(void)notifiedglkmove:(NSNotification*)notification
{
    speedcounter++;
    
    if(speedcounter > speed)
    {
        speedcounter = 0;
        
        NSUInteger shouldmove = arc4random_uniform(moveratio);
        
        if(!shouldmove)
        {
            NSInteger direction = arc4random_uniform(3.0) - 1.0;
            
            self.spatial.x += direction;
            self.spatial.y -= 1;
            self.spatial.repos = YES;
            
            if(self.spatial.y < - self.spatial.height)
            {
                [self.model.items removeObject:self];
            }
        }
    }
}

@end