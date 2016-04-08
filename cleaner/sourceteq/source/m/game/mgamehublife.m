#import "mgamehublife.h"

static NSInteger const maxlife = 1000;
static NSInteger const lifex = 10;
static NSInteger const lifey = 10;
static NSInteger const lifewidth = 200;
static NSInteger const lifeheight = 20;
static NSInteger const lifemarginleft = 26;
static NSInteger const lifemarginright = 8;
static NSInteger const lifemarginvr = 5;

@implementation mgamehublife
{
    NSInteger maxlifewidth;
    NSInteger maxlifeheight;
    NSInteger lifex;
    NSInteger lifey;
    BOOL changed;
}

-(instancetype)init
{
    self = [super init];
    self.amount = maxlife;
    maxlifeheight = lifeheight - (lifemarginvr + lifemarginvr);
    maxlifewidth = lifewidth - (lifemarginleft + lifemarginright);
    lifex = lifex + lifemarginleft;
    lifey = lifey + lifemarginvr;
    changed = YES;
    
    self.spatiallife = [[ghublife alloc] init:lifex y:lifey width:lifewidth height:lifeheight];
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
}

#pragma mark functionality

-(void)reposlife
{
    CGFloat percent = self.amount / (CGFloat)maxlife;
    NSInteger lifewidth = percent * maxlifewidth;
    
    self.spatiallifebar = [[ghublifebar alloc] init:lifex y:lifey width:lifewidth height:maxlifeheight];
}

@end