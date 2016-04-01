#import "appdel.h"

@class mareadust;
@class gareadust;

@interface mareadustitem:NSObject

-(instancetype)init:(mareadust*)model x:(CGFloat)x y:(CGFloat)y;

@property(strong, nonatomic)gareadust *spatial;
@property(weak, nonatomic)mareadust *model;

@end