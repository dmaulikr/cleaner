#import "gtext.h"

@implementation gtext

-(instancetype)init:(NSArray*)textures x:(NSInteger)x y:(NSInteger)y width:(NSInteger)width height:(NSInteger)height
{
    self = [super init:textures];
    self.x = x;
    self.y = y;
    self.width = width;
    self.height = height;
    
    [self render];
    
    return self;
}

@end