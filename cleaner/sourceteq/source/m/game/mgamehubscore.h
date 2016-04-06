#import "appdel.h"

@class mgame;

@interface mgamehubscore:NSObject

-(instancetype)init:(mgame*)model;

@property(weak, nonatomic)mgame *model;
@property(nonatomic)NSUInteger score;

@end