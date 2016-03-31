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

@end