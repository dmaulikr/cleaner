#import <UIKit/UIKit.h>
#import "gspatial.h"
#import "gimage.h"

@interface gspatialtexture:gspatial

@property(strong, nonatomic)gimage *image;
@property(strong, nonatomic)NSMutableData *datatexture;
@property(nonatomic)GLKVector2 *pointertexture;

@end