#import "mfoeiteminvader.h"

static NSInteger const width = 15;
static NSInteger const height = 15;
static NSInteger const life = 8;
static NSInteger const damage = 3;
static NSUInteger const score = 5;

@implementation mfoeiteminvader

-(instancetype)init:(mfoe*)model x:(NSInteger)x
{
    self = [super init:model x:x];
    
    return self;
}

@end