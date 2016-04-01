#import "appdel.h"

@class gfoe;

@interface mfoeitem:NSObject

-(instancetype)init:(NSDictionary*)dictionary;
-(void)rasterize:(CGFloat)x;

@property(strong, nonatomic)gfoe *spatial;

@end