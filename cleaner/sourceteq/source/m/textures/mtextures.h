#import "appdel.h"

extern GLKVector2 *pointertexture;

@interface mtextures:NSObject

-(NSNumber*)textureforasset:(NSString*)asset srgb:(BOOL)srgb;

@property(strong, nonatomic)NSMutableDictionary<NSString*, NSNumber*> *textures;
@property(strong, nonatomic)NSMutableData *datatexture;

@end