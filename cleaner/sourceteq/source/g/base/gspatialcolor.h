#import <UIKit/UIKit.h>
#import "gspatial.h"

@class mcolor;

@interface gspatialcolor:gspatial

-(instancetype)init:(mcolor*)color;

@property(nonatomic)GLKVector4 color;

@end