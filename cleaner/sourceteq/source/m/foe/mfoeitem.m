#import "mfoeitem.h"

static CGFloat const maxspeed = 15;
static CGFloat const ratiochangedirection = 30;
static NSUInteger const minspeed = 1;

@implementation mfoeitem
{
    NSInteger direction;
    NSUInteger speed;
    NSUInteger speedcounter;
}

-(instancetype)init:(NSDictionary*)dictionary model:(mfoe*)model
{
    self = [super init];
    self.model = model;
    self.spatial = [[gfoe alloc] init:self];

    NSArray *assets = dictionary[@"assets"];
    CGFloat width = [dictionary[@"width"] floatValue];
    CGFloat height = [dictionary[@"height"] floatValue];
    
    self.spatial.width = width;
    self.spatial.height = height;
    self.spatial.y = -height;
    [self.spatial.image loadtextures:assets];
    [self choosedirection];
    speed = arc4random_uniform(maxspeed) + minspeed;
    
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
        self.spatial.y++;
        
        if(self.spatial.y > self.model.modelarea.screenheight)
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
        else
        {
            NSUInteger shouldchangedirection = arc4random_uniform(ratiochangedirection);
            
            if(!shouldchangedirection)
            {
                [self choosedirection];
            }
            
            self.spatial.x += direction;
            speedcounter = 0;
            
            [self.spatial render];
        }
    }
}

#pragma mark functionality

-(void)choosedirection
{
    direction = arc4random_uniform(3.0) - 1.0;
}

#pragma mark public

-(void)rasterize:(CGFloat)x
{
    self.spatial.x = x;
    [self.spatial rasterize];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
}

@end