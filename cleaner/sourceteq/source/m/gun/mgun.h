#import "appdel.h"

@class marea;
@class ggunpointer;
@class gguntarget;

@interface mgun:NSObject

-(instancetype)init:(marea*)modelarea;

@property(weak, nonatomic)marea *modelarea;
@property(strong, nonatomic)gguntarget *spatialtarget;
@property(strong, nonatomic)ggunpointer *spatialpointer;

@end