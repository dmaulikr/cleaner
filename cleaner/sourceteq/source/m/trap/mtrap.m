#import "mtrap.h"

static CGFloat const ratioaddtrap = 600;

NSInteger trapwidth_2;
NSInteger trapheight_2;
NSInteger trapminx;
NSInteger trapmaxx;
NSInteger trapmaxy;

@implementation mtrap
{
    strap *strategy;
}

-(instancetype)init:(meffect*)modeleffect life:(mgamehublife*)modellife
{
    self = [super init];
    self.modeleffect = modeleffect;
    self.modellife = modellife;
    self.items = [NSMutableArray array];
    strategy = [[strap alloc] init:self];
    
    trapwidth_2 = trapwidth / 2;
    trapheight_2 = trapheight / 2;
    trapminx = 0;
    trapmaxx = screenwidth - trapwidth;
    trapmaxy = screenheight;
    
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
    NSUInteger shouldadd = arc4random_uniform(ratioaddtrap);
    
    if(!shouldadd)
    {
        [self addtrap];
    }
}

#pragma mark public

-(void)addtrap
{
    mtrapitem *trap = [strategy trap];
    [self.items addObject:trap];
}

@end