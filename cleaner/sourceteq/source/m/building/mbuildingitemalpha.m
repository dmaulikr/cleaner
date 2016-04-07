#import "mbuildingitemalpha.h"

static NSUInteger const width = 134;
static NSUInteger const height = 284;

@implementation mbuildingitemalpha

-(instancetype)init:(NSInteger)x
{
    self = [super init:x];
    
    NSInteger y = screenheight - height;
    self.spatial = [[gbuilding alloc] init:[mtextures singleton].textures_buildingalpha x:x y:y width:width height:height];
    [self.spatial render];
    
    return self;
}

@end