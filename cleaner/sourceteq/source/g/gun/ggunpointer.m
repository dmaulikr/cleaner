#import "ggunpointer.h"

@implementation ggunpointer

-(instancetype)init
{
    self = [super init];
    [self.image loadtextures:@[@"gun_pointer"]];
    
    return self;
}

@end