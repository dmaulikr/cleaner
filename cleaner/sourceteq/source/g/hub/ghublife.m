#import "ghublife.h"

@implementation ghublife

-(instancetype)init:(NSInteger)x y:(NSInteger)y width:(NSInteger)width height:(NSInteger)height
{
    self = [super init:[mtextures singleton].textures_hublife];
    self.x = x;
    self.y = y;
    self.width = width;
    self.height = height;
    
    [self render];
    
    return self;
}

#pragma mark -
#pragma mark spatial

-(void)draw
{
    [super draw];
    
    [self movetotop];
}

@end