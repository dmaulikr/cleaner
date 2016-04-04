#import "ggunwaves.h"

static CGFloat const red = 1;
static CGFloat const green = 1;
static CGFloat const blue = 1;
static CGFloat const alpha = 1;

@interface ggunwaves ()

@property(nonatomic)CGFloat minx;
@property(nonatomic)CGFloat miny;
@property(nonatomic)CGFloat maxx;
@property(nonatomic)CGFloat maxy;

@end

@implementation ggunwaves

-(instancetype)init:(CGFloat)minx miny:(CGFloat)miny maxx:(CGFloat)maxx maxy:(CGFloat)maxy
{
    self = [super init:[mcolor red:red green:green blue:blue alpha:alpha]];
    self.minx = minx;
    self.miny = miny;
    self.maxx = maxx;
    self.maxy = maxy;
    [self rasterize];
    
    return self;
}

#pragma mark -
#pragma mark g spatial

-(void)render
{
    self.dataposition = [NSMutableData data];
    
    NSUInteger index = 0;
    CGFloat minx = self.minx;
    CGFloat maxx = self.maxx;
    CGFloat miny = self.miny;
    CGFloat maxy = self.maxy;
    
    [self vector:index++ x:minx y:miny];
    [self vector:index++ x:minx y:maxy];
    [self vector:index++ x:maxx y:maxy];
    [self vector:index++ x:maxx y:maxy];
    [self vector:index++ x:maxx y:miny];
    [self vector:index++ x:minx y:miny];
}

@end