#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

@interface gimage:NSObject

-(void)loadtextures:(NSArray<NSString*>*)textures;

@property(strong, nonatomic)NSMutableArray<NSNumber*> *textures;
@property(nonatomic)GLuint current;
@property(nonatomic)NSUInteger speed;
@property(nonatomic)BOOL random;
@property(nonatomic)BOOL srgb;
@property(nonatomic)BOOL loading;

@end