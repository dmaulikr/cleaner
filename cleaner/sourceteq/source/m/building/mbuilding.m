#import "mbuilding.h"

@implementation mbuilding

-(instancetype)init:(mtextures*)modeltextures area:(marea*)modelarea
{
    self = [super init];
    self.strategy = [[sbuilding alloc] init:self];
    
    return self;
}

@end