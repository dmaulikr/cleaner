#import "appdel.h"

@class marea;
@class gareadust;

@interface mareadust:NSObject

-(instancetype)init:(marea*)modelarea;
-(void)add;

@property(strong, nonatomic)marea *modelarea;
@property(strong, nonatomic)NSMutableArray<gareadust*> *items;

@end