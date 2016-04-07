#import "appdel.h"

@class vgamehub;
@class mtextures;
@class marea;
@class mgunwaves;
@class ggunpointer;
@class gguntarget;
@class ggunfinger;

@interface mgun:NSObject

-(instancetype)init:(mtextures*)modeltextures area:(marea*)modelarea;
-(void)clearloop;

@property(strong, nonatomic)gguntarget *spatialtarget;
@property(strong, nonatomic)ggunpointer *spatialpointer;
@property(strong, nonatomic)ggunfinger *fingera;
@property(strong, nonatomic)ggunfinger *fingerb;
@property(strong, nonatomic)mgunwaves *modelwaves;
@property(weak, nonatomic)vgamehub *hub;
@property(weak, nonatomic)mtextures *modeltextures;
@property(weak, nonatomic)marea *modelarea;
@property(weak, nonatomic)UITouch *touchstart;
@property(weak, nonatomic)UITouch *touchend;

@end