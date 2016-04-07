#import "appdel.h"
#import "gspatialtexture.h"

@class meffectitem;

@interface geffect:gspatialtexture

-(instancetype)init:(NSArray*)textures realx:(NSInteger)newrealx realy:(NSInteger)newrealy width:(NSInteger)width height:(NSInteger)height rotation:(CGFloat)newrotation;

@end