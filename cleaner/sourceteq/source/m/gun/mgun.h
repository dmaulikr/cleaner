#import "appdel.h"

@class marea;
@class ggunpointer;
@class gguntarget;

@interface mgun:NSObject

-(instancetype)init:(marea*)modelarea;
-(void)startloopat:(CGPoint)point;
-(void)closeloopat:(CGPoint)point;

@property(weak, nonatomic)marea *modelarea;
@property(strong, nonatomic)gguntarget *spatialtarget;
@property(strong, nonatomic)ggunpointer *spatialpointer;
@property(nonatomic)CGPoint loopstart;
@property(nonatomic)CGPoint loopend;
@property(nonatomic)BOOL closedloop;

@end