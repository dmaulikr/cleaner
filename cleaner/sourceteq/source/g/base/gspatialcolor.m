#import "gspatialcolor.h"
#import "mcolor.h"

@implementation gspatialcolor

-(instancetype)init:(mcolor*)color
{
    self = [super init];
    self.color = [color asvector];
    
    return self;
}

#pragma mark -
#pragma mark spatial

-(void)draw:(GLKBaseEffect*)effect
{
    effect.texture2d0.enabled = NO;
    effect.constantColor = self.color;
    
    [super draw:effect];
}

@end