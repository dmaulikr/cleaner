#import "appdel.h"

@class mgamehublife;
@class mgamehubscore;

@interface mgamehub:NSObject

@property(strong, nonatomic)mgamehublife *life;
@property(strong, nonatomic)mgamehubscore *score;

@end