#import "appdel.h"

@class cgame;

@interface vgamehub:UIView

-(instancetype)init:(cgame*)controller;

@property(weak, nonatomic)cgame *controller;

@end