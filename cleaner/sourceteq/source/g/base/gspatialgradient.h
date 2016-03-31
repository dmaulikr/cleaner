#import <UIKit/UIKit.h>
#import "gspatial.h"

@class mcolor;

@interface gspatialgradient:gspatial

@property(nonatomic)GLKVector4 *pointercolor;
@property(strong, nonatomic)mcolor *colorlefttop;
@property(strong, nonatomic)mcolor *colorleftbottom;
@property(strong, nonatomic)mcolor *colorrighttop;
@property(strong, nonatomic)mcolor *colorrightbottom;

@end