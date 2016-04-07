#import "gspatialcolor.h"
#import "appdel.h"

@implementation gspatialcolor
{
    GLKVector4 color;
}

-(instancetype)init:(mcolor*)modelcolor
{
    self = [super init];
    color = [modelcolor asvector];
    
    return self;
}

#pragma mark -
#pragma mark spatial

-(void)draw
{
    effect.texture2d0.enabled = NO;
    effect.constantColor = color;
    
    [super draw];
}

@end