#import "mfoe.h"

//static CGFloat const ratioaddfoe = 50;
static CGFloat const ratioaddfoe = 2;

NSInteger foewidth_2;
NSInteger foeheight_2;
NSInteger foeminx;
NSInteger foemaxx;
NSInteger foemaxy;

@implementation mfoe
{
    sfoe *strategy;
}

-(instancetype)init:(meffect*)modeleffect text:(mtext*)modeltext scorer:(mgamehubscore*)modelscorer
{
    self = [super init];
    self.modeleffect = modeleffect;
    self.modeltext = modeltext;
    self.modelscorer = modelscorer;
    self.items = [NSMutableArray array];
    strategy = [[sfoe alloc] init:self];
    
    foewidth_2 = foewidth / 2.0;
    foeheight_2 = foeheight_2 / 2.0;
    foeminx = foewidth;
    foemaxx = screenwidth - (foewidth + foewidth);
    foemaxy = screenheight;
    
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
    NSUInteger shouldadd = arc4random_uniform(ratioaddfoe);
    
    if(!shouldadd)
    {
        [self addfoe];
    }
}

#pragma mark public

-(void)addfoe
{
    mfoeitem *foe = [strategy foe];
    [self.items addObject:foe];
}

@end