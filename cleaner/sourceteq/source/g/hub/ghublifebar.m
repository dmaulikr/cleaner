#import "ghublifebar.h"

static CGFloat const red = 0.01568;
static CGFloat const green = 0.76862;
static CGFloat const blue = 0.85098;
static CGFloat const alpha = 1;

@implementation ghublifebar

-(instancetype)init:(NSInteger)x y:(NSInteger)y width:(NSInteger)width height:(NSInteger)height
{
    self = [super init:[mcolor red:red green:green blue:blue alpha:alpha]];
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