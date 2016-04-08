#import "mgamehubscore.h"

static NSUInteger const scorex = 220;
static NSUInteger const scorey = 12;

@implementation mgamehubscore
{
    __weak mtext *model;
    mtextitem *modeltext;
    NSUInteger score;
    BOOL shouldprint;
}

-(instancetype)init:(mtext*)newmodel
{
    self = [super init];
    score = 0;
    shouldprint = YES;
    model = newmodel;
    
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
    if(shouldprint)
    {
        shouldprint = NO;
        
        [self printscore];
    }
}

#pragma mark functionality

-(void)printscore
{
    NSString *totalstring = [[tools singleton] numbertostring:@(score)];
    
    modeltext = [model totalscore:totalstring x:scorex y:scorey];
}

#pragma mark public

-(void)addscore:(NSUInteger)addscore
{
    score += addscore;
    shouldprint = YES;
}

@end