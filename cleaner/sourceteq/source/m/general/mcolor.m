#import "mcolor.h"

@implementation mcolor
{
    CGFloat red;
    CGFloat green;
    CGFloat blue;
    CGFloat alpha;
}

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
    mcolor *color = [[mcolor alloc] init:red green:green blue:blue alpha:alpha];
    
    return color;
}

-(instancetype)init:(CGFloat)newred green:(CGFloat)newgreen blue:(CGFloat)newblue alpha:(CGFloat)newalpha
{
    self = [super init];
    red = newred;
    green = newgreen;
    blue = newblue;
    alpha = newalpha;
    
    return self;
}

#pragma mark public

-(GLKVector4)asvector
{
    GLKVector4 vector4 = GLKVector4Make(red, green, blue, alpha);
    
    return vector4;
}

@end