#import <UIKit/UIKit.h>
#import "gspatial.h"

@class mcolor;

@interface gspatialgradient:gspatial

-(instancetype)init:(mcolor*)lefttop leftbottom:(mcolor*)leftbottom righttop:(mcolor*)righttop rightbottom:(mcolor*)rightbottom;

@end