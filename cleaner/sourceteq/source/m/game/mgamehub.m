#import "mgamehub.h"

@implementation mgamehub

-(instancetype)init:(mtext*)modeltext
{
    self = [super init];
    self.life = [[mgamehublife alloc] init];
    self.score = [[mgamehubscore alloc] init:modeltext];
    
    return self;
}

@end