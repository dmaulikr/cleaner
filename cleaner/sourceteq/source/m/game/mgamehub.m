#import "mgamehub.h"

@implementation mgamehub

-(instancetype)init
{
    self = [super init];
    self.life = [[mgamehublife alloc] init];
    self.score = [[mgamehubscore alloc] init];
    
    return self;
}

@end