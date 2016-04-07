#import "appdel.h"

@class mtextures;
@class gbuilding;

@interface mbuildingitem:NSObject

-(instancetype)init:(mtextures*)modeltextures dictionary:(NSDictionary*)dictionary;

@property(weak, nonatomic)mtextures *modeltextures;
@property(strong, nonatomic)gbuilding *spatial;
@property(copy, nonatomic)NSString *assetname;

@end