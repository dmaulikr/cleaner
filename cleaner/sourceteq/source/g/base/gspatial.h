#import <UIKit/UIKit.h>
#import "gimage.h"

static GLsizei const vectorcorners = 6;

@interface gspatial:NSObject

-(void)draw;
-(void)updateprojection:(NSInteger)dx dy:(NSInteger)dy;
-(void)vector:(NSUInteger)index x:(NSInteger)x y:(NSInteger)y;
-(void)render;
-(void)movetotop;

@property(nonatomic)NSInteger width;
@property(nonatomic)NSInteger height;
@property(nonatomic)NSInteger x;
@property(nonatomic)NSInteger y;

@end