#import "appdel.h"

@class mfoeitem;
@class mgame;
@class marea;
@class meffect;
@class mtext;
@class mgamehubscore;

@interface mfoe:NSObject

-(instancetype)init:(mgame*)modelgame area:(marea*)modelarea effect:(meffect*)modeleffect text:(mtext*)modeltext;
-(void)addfoe;
-(void)addscore:(NSUInteger)score;

@property(weak, nonatomic)mgame *modelgame;
@property(weak, nonatomic)marea *modelarea;
@property(weak, nonatomic)meffect *modeleffect;
@property(weak, nonatomic)mtext *modeltext;
@property(weak, nonatomic)mgamehubscore *modelhubscore;
@property(strong, nonatomic)NSMutableArray<mfoeitem*> *items;
@property(strong, nonatomic)NSArray *rawfoes;

@end