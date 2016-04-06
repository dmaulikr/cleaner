#import "mgamehub.h"

static NSInteger const lifeinitial = 100;

@implementation mgamehub

-(instancetype)init:(mgame*)model
{
    self = [super init];
    self.model = model;
    self.life = lifeinitial;
    self.score = 0;
    
    return self;
}

@end