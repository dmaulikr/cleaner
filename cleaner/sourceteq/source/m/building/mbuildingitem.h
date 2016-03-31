#import "appdel.h"

@class gbuilding;

@interface mbuildingitem:NSObject

-(instancetype)init:(NSDictionary*)dictionary x:(CGFloat)x y:(CGFloat)y;

@property(strong, nonatomic)gbuilding *spatial;
@property(copy, nonatomic)NSString *assetname;

@end