#import "gareadust.h"

@implementation gareadust

-(instancetype)init:(NSInteger)x y:(NSInteger)y size:(NSInteger)size
{
    self = [super init:[mtextures singleton].textures_areadust];
    self.x = x;
    self.y = y;
    self.width = size;
    self.height = size;
    
    [self render];
    
    return self;
}

@end