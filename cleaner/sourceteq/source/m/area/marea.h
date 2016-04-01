#import "appdel.h"

@class mareadust;
@class garea;

@interface marea:NSObject

-(GLKMatrix4)asprojectionmatrix;
-(void)rasterize;

@property(strong, nonatomic)mareadust *modeldust;
@property(strong, nonatomic)garea *spatial;
@property(nonatomic)CGFloat screenwidth;
@property(nonatomic)CGFloat screenheight;

@end