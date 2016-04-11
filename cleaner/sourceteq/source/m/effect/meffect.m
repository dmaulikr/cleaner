#import "meffect.h"

NSInteger effectshotpos;
NSInteger effectsmokepos;
NSInteger effectcrownpos;

@implementation meffect

-(instancetype)init
{
    self = [super init];
    self.items = [NSMutableArray array];
    effectshotpos = effectshotsize / -2;
    effectsmokepos = effectsmokesize / -2;
    effectcrownpos = effectcrownsize / -2;
    
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

-(void)crownat:(NSInteger)x
{
    NSInteger y = screenheight + effectcrownpos;
    
    meffectitemcrown *effect = [[meffectitemcrown alloc] init:self x:x y:y];
    [self.items addObject:effect];
}

@end