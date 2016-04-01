#import "appdel.h"

@class mfoeitem;
@class marea;

@interface mfoe:NSObject

-(instancetype)init:(marea*)modelarea;
-(void)addfoe;

@property(weak, nonatomic)marea *modelarea;
@property(strong, nonatomic)NSMutableArray<mfoeitem*> *items;
@property(strong, nonatomic)NSArray *rawfoes;

@end