#import "mfoeiteminvader.h"

static NSInteger const life = 8;
static NSInteger const damage = 3;
static NSUInteger const score = 5;

@implementation mfoeiteminvader

-(instancetype)init:(mfoe*)model x:(NSInteger)x
{
    self = [super init:model x:x];
    self.life = life;
    self.damage = damage;
    self.score = score;
    
    [self spatial:[mtextures singleton].textures_foeinvader width:width height:height];
    
    return self;
}

@end