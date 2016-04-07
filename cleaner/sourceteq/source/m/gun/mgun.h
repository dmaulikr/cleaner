#import "appdel.h"

@class vgamehub;
@class mgunwaves;
@class ggun;

@interface mgun:NSObject

-(void)clearloop;

@property(strong, nonatomic)ggun *spatialtarget;
@property(strong, nonatomic)ggun *spatialpointer;
@property(strong, nonatomic)ggun *spatialfingera;
@property(strong, nonatomic)ggun *spatialfingerb;
@property(strong, nonatomic)mgunwaves *modelwaves;
@property(weak, nonatomic)vgamehub *hub;
@property(weak, nonatomic)UITouch *touchstart;
@property(weak, nonatomic)UITouch *touchend;

@end