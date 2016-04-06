#import "mgamehubscore.h"

@implementation mgamehubscore

-(instancetype)init:(mgame*)model
{
    self = [super init];
    self.model = model;
    self.score = 0;
    
    return self;
}

@end