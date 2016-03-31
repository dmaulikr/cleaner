#import "mfoeitemocto.h"

@implementation mfoeitemocto

-(instancetype)init
{
    self = [super init];
    self.spatial = [[gfoeocto alloc] init:self];
    
    return self;
}

@end