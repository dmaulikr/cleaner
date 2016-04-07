#import "appdel.h"

@interface mtextures:NSObject

+(instancetype)singleton;
-(void)cleartextures;
-(void)loadtextures:(NSArray<NSDictionary*>*)rawtextures;

@property(strong, nonatomic)NSMutableDictionary<NSString*, NSNumber*> *textures;

@end