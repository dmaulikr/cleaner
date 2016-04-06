#import "appdel.h"

@class mgame;
@class mtextitem;

@interface mgamehubscore:NSObject

-(instancetype)init:(mgame*)model;
-(void)addscore:(NSUInteger)addscore;

@property(weak, nonatomic)mgame *model;
@property(weak, nonatomic)mtextitem *modeltext;
@property(nonatomic)NSUInteger score;
@property(nonatomic)BOOL shouldprint;

@end