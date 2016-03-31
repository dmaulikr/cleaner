#import "mcolor.h"

@implementation mcolor

+(instancetype)red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha
{
    mcolor *color = [[mcolor alloc] init];
    color.red = red;
    color.green = green;
    color.blue = blue;
    color.alpha = alpha;
    
    return color;
}

#pragma mark public

-(GLKVector4)asvector
{
    GLKVector4 vector4 = GLKVector4Make(self.red, self.green, self.blue, self.alpha);
    
    return vector4;
}

@end