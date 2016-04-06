#import "appdel.h"

@class mgame;

@interface mgamehub:NSObject

-(instancetype)init:(mgame*)model;

@property(weak, nonatomic)mgame *model;
@property(nonatomic)NSUInteger score;
@property(nonatomic)NSInteger life;

@end