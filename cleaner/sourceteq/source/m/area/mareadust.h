#import "appdel.h"

@class mareadustitem;

@interface mareadust:NSObject

-(void)add;

@property(strong, nonatomic)NSMutableArray<mareadustitem*> *items;

@end