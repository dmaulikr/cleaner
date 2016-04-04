#import "appdel.h"
#import "gspatialcolor.h"

@interface ggunwaves:gspatialcolor

-(instancetype)init:(CGFloat)rotation x:(NSInteger)x y:(NSInteger)y width:(NSInteger)width height:(NSInteger)height realx:(NSInteger)realx realy:(NSInteger)realy;

@property(nonatomic)CGFloat rotation;

@end