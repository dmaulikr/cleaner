#import "appdel.h"

static NSInteger const foewidth = 24;
static NSInteger const foeheight = 24;
extern NSInteger foewidth_2;
extern NSInteger foeheight_2;
extern NSInteger foeminx;
extern NSInteger foemaxx;
extern NSInteger foemaxy;

@class mfoeitem;
@class meffect;
@class mtext;
@class mgamehubscore;

@interface mfoe:NSObject

-(instancetype)init:(meffect*)modeleffect text:(mtext*)modeltext scorer:(mgamehubscore*)modelscorer life:(mgamehublife*)modellife;
-(void)addfoe;

@property(weak, nonatomic)meffect *modeleffect;
@property(weak, nonatomic)mtext *modeltext;
@property(weak, nonatomic)mgamehubscore *modelscorer;
@property(weak, nonatomic)mgamehublife *modellife;
@property(strong, nonatomic)NSMutableArray<mfoeitem*> *items;

@end