#import "gguntarget.h"

@implementation gguntarget

-(instancetype)init:(mtextures*)modeltextures
{
    self = [super init:modeltextures];
    [self.image loadtextures:@[@"gun_target"] model:modeltextures];
    [self rasterize];
    
    return self;
}

@end