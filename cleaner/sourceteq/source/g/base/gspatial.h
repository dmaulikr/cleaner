#import <UIKit/UIKit.h>
#import "gimage.h"

@class GLKBaseEffect;

static GLsizei const vectorcorners = 6;

@interface gspatial:NSObject

-(void)vector:(NSUInteger)index x:(CGFloat)x y:(CGFloat)y;
-(void)draw:(GLKBaseEffect*)effect;
-(void)rasterize;
-(void)render;
-(void)firstrender;
-(void)movetotop;

@property(strong, nonatomic)NSMutableData *dataposition;
@property(nonatomic)GLKVector2 *pointerposition;
@property(nonatomic)CGFloat width;
@property(nonatomic)CGFloat height;
@property(nonatomic)CGFloat x;
@property(nonatomic)CGFloat y;

@end