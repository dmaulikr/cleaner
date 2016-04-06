#import "appdel.h"

@class cgame;

@interface vgamepause:UIView

-(instancetype)init:(cgame*)controller;

@property(weak, nonatomic)cgame *controller;
@property(weak, nonatomic)NSLayoutConstraint *layoutpauseleftmargin;
@property(weak, nonatomic)NSLayoutConstraint *layoutexitleftmargin;

@end