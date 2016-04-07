#import "appdel.h"

@class sbuilding;
@class mbuildingitem;

@interface mbuilding:NSObject

@property(strong, nonatomic)NSMutableArray<mbuildingitem*> *items;
@property(strong, nonatomic)sbuilding *strategy;

@end