#import "meffect.h"

@implementation meffect

-(instancetype)init:(mtextures*)modeltextures
{
    self = [super init];
    self.modeltextures = modeltextures;
    self.items = [NSMutableArray array];
    
    return self;
}

#pragma mark public

-(void)shotatx:(CGFloat)x y:(CGFloat)y
{
    meffectitemshot *effect = [[meffectitemshot alloc] init:self x:x y:y];
    [self.items addObject:effect];
}

-(void)smokeatx:(CGFloat)x y:(CGFloat)y
{
    meffectitemsmoke *effect = [[meffectitemsmoke alloc] init:self x:x y:y];
    [self.items addObject:effect];
}

@end