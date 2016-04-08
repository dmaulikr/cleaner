#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

@interface gimage:NSObject

-(instancetype)init:(NSArray<NSNumber*>*)assets;
-(void)makerandom;
-(void)animationspeed:(NSInteger)newspeed;

@property(nonatomic)GLuint current;

@end