#import <UIKit/UIKit.h>
#import "gspatial.h"
#import "mcolor.h"

@interface gspatialcolor:gspatial

-(instancetype)init:(mcolor*)color;

@property(nonatomic)GLKVector4 color;

@end