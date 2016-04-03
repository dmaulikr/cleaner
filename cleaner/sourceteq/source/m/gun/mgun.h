#import "appdel.h"

@class vgamehub;
@class marea;
@class ggunpointer;
@class gguntarget;

@interface mgun:NSObject

-(instancetype)init:(marea*)modelarea;
-(void)clearloop;

@property(strong, nonatomic)gguntarget *spatialtarget;
@property(strong, nonatomic)ggunpointer *spatialpointer;
@property(weak, nonatomic)vgamehub *hub;
@property(weak, nonatomic)marea *modelarea;
@property(weak, nonatomic)UITouch *touchstart;
@property(weak, nonatomic)UITouch *touchend;

@end