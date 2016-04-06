#import "ghublife.h"

@implementation ghublife

-(instancetype)init
{
    self = [super init];
    [self.image loadtextures:@[@"hub_life"]];
    
    return self;
}

@end