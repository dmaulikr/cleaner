#import "mgamehubscore.h"

static NSUInteger const scorex = 220;
static NSUInteger const scorey = 30;

@implementation mgamehubscore

-(instancetype)init:(mgame*)model
{
    self = [super init];
    self.model = model;
    self.score = 0;
    [self printscore];
    
    return self;
}

#pragma mark functionality

-(void)printscore
{
    NSString *totalstring = [[tools singleton] numbertostring:@(self.score)];
    self.modeltext = [self.model.modeltext addtotalscore:totalstring x:scorex y:scorey];
}

@end