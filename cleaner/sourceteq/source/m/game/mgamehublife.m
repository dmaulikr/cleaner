#import "mgamehublife.h"

static NSInteger const maxlife = 100;
static NSInteger const lifex = 10;
static NSInteger const lifey = 10;
static NSInteger const lifewidth = 200;
static NSInteger const lifeheight = 20;
static NSInteger const lifemarginleft = 26;
static NSInteger const lifemarginright = 8;
static NSInteger const lifemarginvr = 6;

@implementation mgamehublife
{
    ghublife *spatiallife;
    ghublifebar *spatiallifebar;
    NSInteger maxlifewidth;
    NSInteger maxlifeheight;
    NSInteger barlifex;
    NSInteger barlifey;
    BOOL changed;
}

-(instancetype)init
{
    self = [super init];
    self.amount = maxlife;
    maxlifeheight = lifeheight - (lifemarginvr + lifemarginvr);
    maxlifewidth = lifewidth - (lifemarginleft + lifemarginright);
    barlifex = lifex + lifemarginleft;
    barlifey = lifey + lifemarginvr;
    changed = YES;
    
    spatiallife = [[ghublife alloc] init:lifex y:lifey width:lifewidth height:lifeheight];
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
    if(changed)
    {
        changed = NO;
        [self reposlife];
    }
    
    [spatiallifebar movetotop];
}

#pragma mark functionality

-(void)reposlife
{
    CGFloat percent = self.amount / (CGFloat)maxlife;
    NSInteger lifewidth = percent * maxlifewidth;
    
    spatiallifebar = [[ghublifebar alloc] init:barlifex y:barlifey width:lifewidth height:maxlifeheight];
}

#pragma mark public

-(void)receivedamage:(NSInteger)amount
{
    self.amount -= amount;
    
    if(self.amount < 1)
    {
        [self.controller gameover];
    }
    
    changed = YES;
}

@end