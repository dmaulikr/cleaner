#import "appdel.h"

static NSInteger const trapwidth = 20;
static NSInteger const trapheight = 20;
extern NSInteger trapwidth_2;
extern NSInteger trapheight_2;
extern NSInteger trapminx;
extern NSInteger trapmaxx;
extern NSInteger trapmaxy;

@class mtrapitem;
@class meffect;
@class mgamehubscore;

@interface mtrap:NSObject

-(instancetype)init:(meffect*)modeleffect life:(mgamehublife*)modellife;
-(void)addtrap;

@property(weak, nonatomic)meffect *modeleffect;
@property(weak, nonatomic)mgamehublife *modellife;
@property(strong, nonatomic)NSMutableArray<mtrapitem*> *items;

@end