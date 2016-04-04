#import "ggunwaves.h"

@interface ggunwaves ()

@property(nonatomic)CGFloat minx;
@property(nonatomic)CGFloat miny;
@property(nonatomic)CGFloat maxx;
@property(nonatomic)CGFloat maxy;

@end

@implementation ggunwaves

-(instancetype)init:(CGFloat)minx miny:(CGFloat)miny maxx:(CGFloat)maxx maxy:(CGFloat)maxy
{
    self = [super init];
    self.minx = minx;
    self.miny = miny;
    self.maxx = maxx;
    self.maxy = maxy;
    
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