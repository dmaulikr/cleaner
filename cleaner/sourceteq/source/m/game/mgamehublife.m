#import "mgamehublife.h"

static NSInteger const initialamount = 100;

@implementation mgamehublife

-(instancetype)init:(mgame*)model
{
    self = [super init];
    self.model = model;
    self.amount = initialamount;
    
    return self;
}

@end