#import "mtrapitembomb.h"

static NSInteger const damage = 20;

@implementation mtrapitembomb

-(instancetype)init:(mtrap*)model x:(NSInteger)x
{
    self = [super init:model x:x];
    self.damage = damage;
    
    [self spatial:[mtextures singleton].textures_trapbomb];
    
    return self;
}

@end