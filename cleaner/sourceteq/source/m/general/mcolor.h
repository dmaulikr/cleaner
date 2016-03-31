#import "appdel.h"

@interface mcolor:NSObject

+(instancetype)red:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
-(GLKVector4)asvector;

@property(nonatomic)CGFloat red;
@property(nonatomic)CGFloat green;
@property(nonatomic)CGFloat blue;
@property(nonatomic)CGFloat alpha;

@end