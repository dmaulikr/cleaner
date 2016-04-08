#import "meffect.h"

NSInteger effectshot_pos;
NSInteger effectsmoke_pos;

@implementation meffect

-(instancetype)init
{
    self = [super init];
    self.items = [NSMutableArray array];
    effectshot_pos = effectshotsize / -2.0;
    effectsmoke_pos = effectsmokesize / -2.0;
    
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