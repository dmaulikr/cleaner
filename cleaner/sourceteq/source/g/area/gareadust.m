#import "gareadust.h"

static NSUInteger const size = 23;

@implementation gareadust

-(instancetype)init
{
    self = [super init];
    self.width = size;
    self.height = size;
    
    return self;
}

@end