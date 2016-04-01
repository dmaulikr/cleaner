#import "appdel.h"

@class marea;
@class mareadustitem;

@interface mareadust:NSObject

-(instancetype)init:(marea*)modelarea;
-(void)add;

@property(strong, nonatomic)marea *modelarea;
@property(strong, nonatomic)NSMutableArray<mareadustitem*> *items;

@end