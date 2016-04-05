#import "appdel.h"

@class mfoeitem;
@class marea;
@class meffect;
@class mtext;

@interface mfoe:NSObject

-(instancetype)init:(marea*)modelarea effect:(meffect*)modeleffect text:(mtext*)modeltext;
-(void)addfoe;

@property(weak, nonatomic)marea *modelarea;
@property(weak, nonatomic)meffect *modeleffect;
@property(weak, nonatomic)mtext *modeltext;
@property(strong, nonatomic)NSMutableArray<mfoeitem*> *items;
@property(strong, nonatomic)NSArray *rawfoes;

@end