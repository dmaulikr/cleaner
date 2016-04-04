#import "meffect.h"

@implementation meffect

-(instancetype)init
{
    self = [super init];
    self.items = [NSMutableArray array];
    
    return self;
}

#pragma mark public

-(void)shotatx:(CGFloat)x y:(CGFloat)y
{
    meffectitemshot *effect = [[meffectitemshot alloc] init:self x:x y:y];
    [self.items addObject:effect];
}

@end