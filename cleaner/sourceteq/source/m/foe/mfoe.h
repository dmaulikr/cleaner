#import "appdel.h"

@class mfoeitem;
@class marea;
@class meffect;

@interface mfoe:NSObject

-(instancetype)init:(marea*)modelarea effect:(meffect*)modeleffect;
-(void)addfoe;

@property(weak, nonatomic)marea *modelarea;
@property(weak, nonatomic)meffect *modeleffect;
@property(strong, nonatomic)NSMutableArray<mfoeitem*> *items;
@property(strong, nonatomic)NSArray *rawfoes;

@end