#import "gareadust.h"

static NSUInteger const size = 11;

@implementation gareadust

-(instancetype)init:(NSInteger)x y:(NSInteger)y
{
    self = [super init:<#(NSArray<NSString *> *)#>];
    self.x = x;
    self.y = y;
    self.width = size;
    self.height = size;
    [self.image loadtextures:@[@"area_dust"] model:modeltextures];
    
    return self;
}

@end