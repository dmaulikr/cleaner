#import "appdel.h"

@class cgame;
@class vgamehub;
@class vgamepause;

@interface vgame:GLKView<GLKViewDelegate>

-(instancetype)init:(cgame*)controller;
-(void)pause;

@property(weak, nonatomic)cgame *controller;
@property(weak, nonatomic)vgamehub *hub;
@property(weak, nonatomic)vgamepause *viewpause;

@end