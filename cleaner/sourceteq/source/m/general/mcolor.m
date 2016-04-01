#import "mcolor.h"

@implementation mcolor

+(instancetype)basecolor:(NSDictionary*)basecolor delta:(CGFloat)delta
{
    mcolor *color;
    CGFloat basered = [basecolor[@"red"] floatValue];
    CGFloat basegreen = [basecolor[@"green"] floatValue];
    CGFloat baseblue = [basecolor[@"blue"] floatValue];
    CGFloat basealpha = [basecolor[@"alpha"] floatValue];
    CGFloat alpha = basealpha + delta;
    
    if(alpha > 1)
    {
        alpha = 1;
    }
    else if(alpha < 0)
    {
        alpha = 0;
    }
    
    color = [mcolor red:basered green:basegreen blue:baseblue alpha:alpha];
    
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