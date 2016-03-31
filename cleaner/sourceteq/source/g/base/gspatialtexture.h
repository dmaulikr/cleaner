#import <UIKit/UIKit.h>
#import "gspatial.h"
#import "gimage.h"

@interface gspatialtexture:gspatial

@property(strong, nonatomic)gimage *image;
@property(nonatomic)GLKVector2 *pointertexture;
@property(nonatomic)GLKVector4 color;

@end