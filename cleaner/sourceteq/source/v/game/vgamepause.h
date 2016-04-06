#import "appdel.h"

@class cgame;

@interface vgamepause:UIView

-(instancetype)init:(cgame*)controller;

@property(weak, nonatomic)cgame *controller;

@end