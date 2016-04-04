#import "gguntarget.h"

@implementation gguntarget

-(instancetype)init
{
    self = [super init];
    [self.image loadtextures:@[@"gun_target"]];
    [self rasterize];
    
    return self;
}

@end