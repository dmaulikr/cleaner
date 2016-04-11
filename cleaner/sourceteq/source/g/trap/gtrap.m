#import "gtrap.h"

@implementation gtrap

-(instancetype)init:(NSArray<NSNumber*>*)textures x:(NSInteger)x y:(NSInteger)y
{
    self = [super init:textures];
    self.x = x;
    self.y = y;
    self.width = trapwidth;
    self.height = trapheight;
    
    [self render];
    
    return self;
}

@end