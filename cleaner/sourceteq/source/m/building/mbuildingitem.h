#import "appdel.h"

@class gbuildingitem;

@interface mbuildingitem:NSObject

-(instancetype)init:(NSDictionary*)dictionary x:(CGFloat)x y:(CGFloat)y;

@property(strong, nonatomic)gbuildingitem *spatial;
@property(copy, nonatomic)NSString *assetname;

@end