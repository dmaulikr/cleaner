#import "appdel.h"

@class mgame;
@class mtextitem;

@interface mgamehubscore:NSObject

-(instancetype)init:(mgame*)model;

@property(weak, nonatomic)mgame *model;
@property(weak, nonatomic)mtextitem *modeltext;
@property(nonatomic)NSUInteger score;

@end