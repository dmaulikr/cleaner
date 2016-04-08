#import "appdel.h"

@class mtext;
@class mgamehublife;
@class mgamehubscore;

@interface mgamehub:NSObject

-(instancetype)init:(mtext*)modeltext;

@property(strong, nonatomic)mgamehublife *life;
@property(strong, nonatomic)mgamehubscore *score;

@end