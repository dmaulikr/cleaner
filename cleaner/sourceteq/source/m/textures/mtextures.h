#import "appdel.h"

@interface mtextures:NSObject

-(NSNumber*)textureforasset:(NSString*)asset srgb:(BOOL)srgb;

@property(strong, nonatomic)NSMutableDictionary<NSString*, NSNumber*> *textures;

@end