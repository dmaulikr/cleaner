#import "appdel.h"

@class mtextitem;

@interface mgamehubscore:NSObject

-(instancetype)init:(mtext*)model;

@property(weak, nonatomic)mtext *model;
@property(weak, nonatomic)mtextitem *modeltext;

@end