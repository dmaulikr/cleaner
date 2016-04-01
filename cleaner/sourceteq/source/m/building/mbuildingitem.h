#import "appdel.h"

@class gbuilding;

@interface mbuildingitem:NSObject

-(instancetype)init:(NSDictionary*)dictionary;

@property(strong, nonatomic)gbuilding *spatial;
@property(copy, nonatomic)NSString *assetname;

@end