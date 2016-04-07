#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

@class mtextures;

@interface gimage:NSObject

-(void)loadtextures:(NSArray<NSString*>*)textures model:(mtextures*)modeltextures;

@property(strong, nonatomic)NSMutableArray<NSNumber*> *textures;
@property(nonatomic)GLuint current;
@property(nonatomic)NSUInteger speed;
@property(nonatomic)BOOL random;
@property(nonatomic)BOOL srgb;
@property(nonatomic)BOOL loading;

@end