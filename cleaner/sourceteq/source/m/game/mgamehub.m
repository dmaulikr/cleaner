#import "mgamehub.h"

@implementation mgamehub

-(instancetype)init:(mgame*)model
{
    self = [super init];
    self.life = [[mgamehublife alloc] init:model];
    self.score = [[mgamehubscore alloc] init:model];
    
    return self;
}

@end