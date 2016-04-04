#import "ggunpointer.h"

@implementation ggunpointer

-(instancetype)init
{
    self = [super init];
    [self.image loadtextures:@[@"gun_pointer"]];
    [self rasterize];
    
    return self;
}

@end