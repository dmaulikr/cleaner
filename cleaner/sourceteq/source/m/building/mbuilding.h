#import "appdel.h"

@class mbuildingitem;
@class marea;

@interface mbuilding:NSObject

-(instancetype)init:(marea*)modelarea;

@property(weak, nonatomic)marea *modelarea;
@property(strong, nonatomic)NSMutableArray<mbuildingitem*> *items;
@property(strong, nonatomic)NSArray *rawbuldings;

@end