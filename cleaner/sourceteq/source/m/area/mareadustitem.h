#import "appdel.h"

@class mareadust;
@class gareadust;

@interface mareadustitem:NSObject

-(instancetype)init:(mareadust*)model x:(NSInteger)newx y:(NSInteger)newy;

@property(weak, nonatomic)mareadust *model;

@end