#import "mgamehubscore.h"

static NSUInteger const scorex = 220;
static NSUInteger const scorey = 12;

@implementation mgamehubscore

-(instancetype)init:(mgame*)model
{
    self = [super init];
    self.model = model;
    self.score = 0;
    self.shouldprint = YES;
    
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
    if(self.shouldprint)
    {
        self.shouldprint = NO;
        
        [self printscore];
    }
}

#pragma mark functionality

-(void)printscore
{
    NSString *totalstring = [[tools singleton] numbertostring:@(self.score)];
    
    if(self.modeltext)
    {
        [self.model.modeltext.items removeObject:self.modeltext];
    }
    
    self.modeltext = [self.model.modeltext addtotalscore:totalstring x:scorex y:scorey];
}

-(void)addscore:(NSUInteger)addscore
{
    self.score += addscore;
    self.shouldprint = YES;
}

@end