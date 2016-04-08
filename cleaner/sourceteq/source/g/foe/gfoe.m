#import "gfoe.h"

static NSUInteger const imagespeed = 180;

@implementation gfoe

-(instancetype)init:(NSArray<NSNumber*>*)textures x:(NSInteger)x y:(NSInteger)y
{
    self = [super init:textures];
    self.x = x;
    self.y = y;
    self.width = foewidth;
    self.height = foeheight;
    
    [[self image] animationspeed:imagespeed];
    [[self image] makerandom];
    [self render];

    return self;
}

@end