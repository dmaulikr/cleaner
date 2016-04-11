#import "mtrap.h"

static CGFloat const ratioaddtrap = 600;

@implementation mtrap

-(instancetype)init
{
    self = [super init];
    self.items = [NSMutableArray array];
    
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
    mfoeitem *foe = [strategy foe];
    [self.items addObject:foe];
}

@end