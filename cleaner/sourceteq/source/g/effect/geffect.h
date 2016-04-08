#import "appdel.h"
#import "gspatialtexture.h"

@class meffectitem;

@interface geffect:gspatialtexture

-(instancetype)init:(NSArray<NSNumber*>*)textures realx:(NSInteger)realx realy:(NSInteger)realy width:(NSInteger)width height:(NSInteger)height rotation:(CGFloat)rotation;

@end