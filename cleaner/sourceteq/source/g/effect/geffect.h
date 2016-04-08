#import "appdel.h"
#import "gspatialtexture.h"

@class meffectitem;

@interface geffect:gspatialtexture

-(instancetype)init:(NSArray<NSNumber*>*)textures realx:(NSInteger)realx realy:(NSInteger)realy size:(NSInteger)size pos:(NSInteger)pos rotation:(CGFloat)rotation;

@end