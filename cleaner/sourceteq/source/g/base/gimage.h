#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

@interface gimage:NSObject

-(instancetype)init:(NSArray<NSString*>*)assets;

@property(nonatomic)GLuint current;
@property(nonatomic)NSUInteger speed;
@property(nonatomic)BOOL random;

@end