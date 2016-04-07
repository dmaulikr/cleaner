#import "gareadust.h"

static NSUInteger const size = 11;

@implementation gareadust

-(instancetype)init:(mtextures*)modeltextures
{
    self = [super init];
    self.width = size;
    self.height = size;
    [self.image loadtextures:@[@"area_dust"] model:modeltextures];
    
    return self;
}

@end