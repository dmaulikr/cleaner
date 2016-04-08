#import "appdel.h"

@class mfoeitem;
@class meffect;
@class mtext;
@class mgamehubscore;

@interface mfoe:NSObject

-(instancetype)init:(meffect*)modeleffect text:(mtext*)modeltext scorer:(mgamehubscore*)modelscorer;
-(void)addfoe;

@property(weak, nonatomic)meffect *modeleffect;
@property(weak, nonatomic)mtext *modeltext;
@property(weak, nonatomic)mgamehubscore *modelscorer;
@property(strong, nonatomic)NSMutableArray<mfoeitem*> *items;

@end