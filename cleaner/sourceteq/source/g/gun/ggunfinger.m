#import "ggunfinger.h"

@implementation ggunfinger

-(instancetype)init:(mtextures*)modeltextures
{
    self = [super init:modeltextures];
    [self.image loadtextures:@[@"gun_finger"] model:modeltextures];
    [self rasterize];
    
    return self;
}

@end