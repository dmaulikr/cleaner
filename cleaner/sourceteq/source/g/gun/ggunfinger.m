#import "ggunfinger.h"

@implementation ggunfinger

-(instancetype)init
{
    self = [super init];
    [self.image loadtextures:@[@"finger"]];
    
    return self;
}

@end