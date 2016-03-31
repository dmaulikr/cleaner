#import <UIKit/UIKit.h>
#import "gimage.h"

static GLsizei const vectorcorners = 6;

@interface gspatial:NSObject

-(void)rasterize;
-(void)render;
-(void)draw:(GLKBaseEffect*)effect;

@property(nonatomic)GLKVector2 *pointerposition;
@property(nonatomic)CGFloat width;
@property(nonatomic)CGFloat height;
@property(nonatomic)CGFloat x;
@property(nonatomic)CGFloat y;
@property(nonatomic)BOOL repos;

@end