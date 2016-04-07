#import "mfoe.h"

static CGFloat const ratioaddfoe = 5;
//static CGFloat const ratioaddfoe = 50;

@implementation mfoe

-(instancetype)init:(meffect*)modeleffect text:(mtext*)modeltext;
{
    self = [super init];
    self.modeleffect = modeleffect;
    self.modeltext = modeltext;
    self.items = [NSMutableArray array];
    self.rawfoes = @[
                     [mfoeiteminvader class],
                     [mfoeitemocto class]
                     ];
    
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
    NSUInteger index = arc4random_uniform((CGFloat)self.rawfoes.count);
    NSDictionary *rawfoe = self.rawfoes[index];
    mfoeitem *foe = [[mfoeitem alloc] init:rawfoe model:self];
    CGFloat maxx = self.modelarea.screenwidth - foe.spatial.width;
    CGFloat x = arc4random_uniform(maxx);
    
    [foe rasterize:x];
    [self.items addObject:foe];
}

-(void)addscore:(NSUInteger)score
{
    [self.modelhubscore addscore:score];
}

@end