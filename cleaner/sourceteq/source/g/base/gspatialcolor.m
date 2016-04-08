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
    globaltexture.enabled = NO;
    globaleffect.constantColor = color;
    
    [super draw];
}

@end