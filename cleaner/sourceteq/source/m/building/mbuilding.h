#import "appdel.h"

@class mtextures;
@class mbuildingitem;
@class marea;

@interface mbuilding:NSObject

-(instancetype)init:(mtextures*)modeltextures area:(marea*)modelarea;

@property(weak, nonatomic)mtextures *modeltextures;
@property(weak, nonatomic)marea *modelarea;
@property(strong, nonatomic)NSMutableArray<mbuildingitem*> *items;
@property(strong, nonatomic)NSArray *rawbuldings;

@end