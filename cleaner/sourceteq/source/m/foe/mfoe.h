#import "appdel.h"

@class mfoeitem;
@class meffect;
@class mtext;

@interface mfoe:NSObject

-(instancetype)init:(meffect*)modeleffect text:(mtext*)modeltext;
-(void)addfoe;

@property(weak, nonatomic)meffect *modeleffect;
@property(weak, nonatomic)mtext *modeltext;
@property(strong, nonatomic)NSMutableArray<mfoeitem*> *items;

@end