#import "gguntarget.h"

@implementation gguntarget

-(instancetype)init
{
    self = [super init];
    [self.image loadtextures:@[@"gun_target"]];
    
    return self;
}

@end