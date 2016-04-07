#import "appdel.h"
#import "gspatialtexture.h"

@interface ggun:gspatialtexture

-(instancetype)init:(NSArray<NSNumber*>*)textures width:(NSInteger)width height:(NSInteger)height;
-(void)deactivate;
-(void)makeactive;

@end