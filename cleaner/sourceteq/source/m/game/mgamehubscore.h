#import "appdel.h"

@class mtextitem;

@interface mgamehubscore:NSObject

-(instancetype)init:(mtext*)model;
-(void)addscore:(NSUInteger)addscore;

@property(weak, nonatomic)mtext *model;
@property(weak, nonatomic)mtextitem *modeltext;

@end