#import "mgamehub.h"

@implementation mgamehub

-(instancetype)init:(mgame*)model
{
    self = [super init];
    self.model = model;
    
    return self;
}

@end