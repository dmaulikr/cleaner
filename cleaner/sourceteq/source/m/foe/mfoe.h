#import "appdel.h"

static NSInteger const foewidth = 16;
static NSInteger const foeheight = 16;
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

-(instancetype)init:(meffect*)modeleffect text:(mtext*)modeltext scorer:(mgamehubscore*)modelscorer;
-(void)addfoe;

@property(weak, nonatomic)meffect *modeleffect;
@property(weak, nonatomic)mtext *modeltext;
@property(weak, nonatomic)mgamehubscore *modelscorer;
@property(strong, nonatomic)NSMutableArray<mfoeitem*> *items;

@end