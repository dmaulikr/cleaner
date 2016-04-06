#import "appdel.h"

@class mgame;
@class ghublife;
@class ghublifebar;

@interface mgamehublife:NSObject

-(instancetype)init:(mgame*)model;

@property(weak, nonatomic)mgame *model;
@property(strong, nonatomic)ghublife *spatiallife;
@property(strong, nonatomic)ghublifebar *spatiallifebar;
@property(nonatomic)NSInteger amount;
@property(nonatomic)BOOL changed;

@end