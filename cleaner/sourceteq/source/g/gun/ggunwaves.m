#import "ggunwaves.h"

static CGFloat const red = 1;
static CGFloat const green = 1;
static CGFloat const blue = 1;
static CGFloat const alpha = 0.4;

@interface ggunwaves ()

@property(nonatomic)NSInteger realx;
@property(nonatomic)NSInteger realy;

@end

@implementation ggunwaves

-(instancetype)init:(CGFloat)rotation x:(NSInteger)x y:(NSInteger)y width:(NSInteger)width height:(NSInteger)height realx:(NSInteger)realx realy:(NSInteger)realy
{
    self = [super init:[mcolor red:red green:green blue:blue alpha:alpha]];
    self.rotation = rotation;
    self.x = x;
    self.y = y;
    self.width = width;
    self.height = height;
    self.realx = realx;
    self.realy = realy;
    [self rasterize];
    
    return self;
}

#pragma mark -
#pragma mark g spatial

-(void)draw:(GLKBaseEffect*)effect
{
    effect.transform.modelviewMatrix = GLKMatrix4Multiply(GLKMatrix4MakeTranslation(self.realx, self.realy, 0), GLKMatrix4MakeRotation(self.rotation, 0, 0, 1));
    [super draw:effect];
    effect.transform.modelviewMatrix = GLKMatrix4MakeRotation(0, 0, 0, 1);
}

@end