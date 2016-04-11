#import "mtrap.h"

static CGFloat const ratioaddtrap = 600;

@implementation mtrap
{
    strap *strategy;
}

-(instancetype)init
{
    self = [super init];
    self.items = [NSMutableArray array];
    strategy = [[strap alloc] init:self];
    
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