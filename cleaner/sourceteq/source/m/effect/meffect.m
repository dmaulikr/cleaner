#import "meffect.h"

@implementation meffect

-(instancetype)init
{
    self = [super init];
    self.items = [NSMutableArray array];
    
    return self;
}

#pragma mark public

-(void)shotatx:(NSInteger)x y:(NSInteger)y
{
    meffectitemshot *effect = [[meffectitemshot alloc] init:self x:x y:y];
    [self.items addObject:effect];
}

-(void)smokeatx:(NSInteger)x y:(NSInteger)y
{
    meffectitemsmoke *effect = [[meffectitemsmoke alloc] init:self x:x y:y];
    [self.items addObject:effect];
}

@end