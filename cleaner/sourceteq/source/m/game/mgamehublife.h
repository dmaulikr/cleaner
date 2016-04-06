#import "appdel.h"

@class mgame;

@interface mgamehublife:NSObject

-(instancetype)init:(mgame*)model;

@property(weak, nonatomic)mgame *model;
@property(nonatomic)NSInteger amount;

@end