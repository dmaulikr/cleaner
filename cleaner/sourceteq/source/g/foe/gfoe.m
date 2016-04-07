#import "gfoe.h"

static NSUInteger const imagespeed = 180;

@implementation gfoe

-(instancetype)init:(NSArray<NSNumber*>*)textures x:(NSInteger)x y:(NSInteger)y width:(NSInteger)width height:(NSInteger)height
{
    self = [super init:textures];
    self.image.random = YES;
    self.image.speed = imagespeed;
    self.x = x;
    self.y = y;
    self.width = width;
    self.height = height;
    [self render];

    return self;
}

@end