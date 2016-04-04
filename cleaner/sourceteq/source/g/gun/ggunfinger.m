#import "ggunfinger.h"

@implementation ggunfinger

-(instancetype)init
{
    self = [super init];
    [self.image loadtextures:@[@"gun_finger"]];
    [self rasterize];
    
    return self;
}

@end