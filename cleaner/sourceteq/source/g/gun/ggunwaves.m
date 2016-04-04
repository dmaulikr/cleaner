#import "ggunwaves.h"

@implementation ggunwaves

-(instancetype)init:(CGFloat)x y:(CGFloat)y width:(CGFloat)width
{
    return self;
}

#pragma mark -
#pragma mark g spatial

-(void)render
{
    self.dataposition = [NSMutableData data];
    
    NSUInteger index = 0;
    CGFloat minx = self.x;
    CGFloat maxx = minx + self.width;
    CGFloat miny = self.y;
    CGFloat maxy = miny + self.height;
    
    [self vector:index++ x:minx y:miny];
    [self vector:index++ x:minx y:maxy];
    [self vector:index++ x:maxx y:maxy];
    [self vector:index++ x:maxx y:maxy];
    [self vector:index++ x:maxx y:miny];
    [self vector:index++ x:minx y:miny];
}

@end