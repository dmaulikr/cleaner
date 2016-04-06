#import "appdel.h"

@class mgame;
@class mgamehublife;
@class mgamehubscore;

@interface mgamehub:NSObject

-(instancetype)init:(mgame*)model;

@property(strong, nonatomic)mgamehublife *life;
@property(strong, nonatomic)mgamehubscore *score;

@end