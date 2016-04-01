#import "gareadust.h"

static NSUInteger const size = 11;

@implementation gareadust

-(instancetype)init
{
    self = [super init];
    self.width = size;
    self.height = size;
    [self.image loadtextures:@[@"dust"]];
    
    return self;
}

@end