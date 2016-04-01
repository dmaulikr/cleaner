#import "mcolor.h"

@implementation mcolor

+(instancetype)basecolor:(NSDictionary*)basecolor delta:(CGFloat)delta
{
    mcolor *color;
    CGFloat basered = [basecolor[@"red"] floatValue];
    CGFloat basegreen = [basecolor[@"green"] floatValue];
    CGFloat baseblue = [basecolor[@"blue"] floatValue];
    CGFloat basealpha = [basecolor[@"alpha"] floatValue];
    CGFloat red = basered + delta;
    CGFloat green = basegreen + delta;
    CGFloat blue = baseblue + delta;
    
    if(red > 1)
    {
        red = 1;
    }
    else if(red < 0)
    {
        red = 0;
    }
    
    if(green > 1)
    {
        green = 1;
    }
    else if(green < 0)
    {
        green = 0;
    }
    
    if(blue > 1)
    {
        blue = 1;
    }
    else if(blue < 0)
    {
        blue = 0;
    }
    
    color = [mcolor red:red green:green blue:blue alpha:basealpha];
    
    return color;
}

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