#import "appdel.h"

@interface mtextures:NSObject

-(void)cleartextures;
-(void)loadtextures:(NSArray<NSDictionary<NSString*, NSNumber*>*>*)rawtextures;

@property(strong, nonatomic)NSMutableDictionary<NSString*, NSNumber*> *textures;

@end