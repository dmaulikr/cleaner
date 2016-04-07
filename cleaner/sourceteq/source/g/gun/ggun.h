#import <UIKit/UIKit.h>
#import "gspatialtexture.h"

@interface ggun:gspatialtexture

-(instancetype)init:(NSArray<NSNumber*>*)textures x:(NSInteger)x y:(NSInteger)y width:(NSInteger)width height:(NSInteger)height;
-(void)deacivate;
-(void)makeactive;

@end