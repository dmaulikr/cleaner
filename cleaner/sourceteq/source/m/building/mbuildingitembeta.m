#import "mbuildingitembeta.h"

static NSUInteger const width = 167;
static NSUInteger const height = 370;

@implementation mbuildingitembeta

-(instancetype)init:(NSInteger)x
{
    self = [super init:x];
    
    NSInteger y = screenheight - height;
    self.spatial = [[gbuilding alloc] init:[mtextures singleton].textures_buildingbeta x:x y:y width:width height:height];
    [self.spatial render];
    
    return self;
}

@end