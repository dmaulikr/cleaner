#import "appdel.h"

@class mbuildingitem;

@interface mbuilding:NSObject

-(void)addbuildingatx:(CGFloat)x y:(CGFloat)y;

@property(strong, nonatomic)NSMutableArray<mbuildingitem*> *items;
@property(strong, nonatomic)NSArray *rawbuldings;

@end