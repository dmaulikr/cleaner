#import "ggunpointer.h"

@implementation ggunpointer

-(instancetype)init:(mtextures*)modeltextures
{
    self = [super init:modeltextures];
    [self.image loadtextures:@[@"gun_pointer"] model:modeltextures];
    [self rasterize];
    
    return self;
}

@end