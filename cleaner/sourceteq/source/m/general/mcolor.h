#import "appdel.h"

@interface mcolor:NSObject

+(instancetype)basecolor:(NSDictionary*)basecolor delta:(CGFloat)delta;
+(instancetype)red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
-(GLKVector4)asvector;

@end