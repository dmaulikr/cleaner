#import "appdel.h"

@class vgamehub;
@class mgunwaves;
@class ggun;

@interface mgun:NSObject

-(void)clearloop;
-(void)receivehub:(vgamehub*)newhub;

@property(strong, nonatomic)mgunwaves *modelwaves;
@property(weak, nonatomic)UITouch *touchstart;
@property(weak, nonatomic)UITouch *touchend;

@end