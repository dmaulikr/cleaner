#import "mbuilding.h"

@implementation mbuilding

-(instancetype)init
{
    self = [super init];
    self.items = [NSMutableArray array];
    self.strategy = [[sbuilding alloc] init:self];
    
    return self;
}

@end