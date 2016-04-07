#import <UIKit/UIKit.h>
#import "gspatial.h"
#import "gimage.h"

@interface gspatialtexture:gspatial

-(instancetype)init:(NSArray<NSNumber*>*)assets;

@property(strong, nonatomic)gimage *image;

@end