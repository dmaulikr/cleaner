#import "appdel.h"

@class mtextures;
@class mareadust;
@class garea;

@interface marea:NSObject

-(instancetype)init:(mtextures*)modeltextures;
-(void)rasterize;

@property(weak, nonatomic)mtextures *modeltextures;
@property(strong, nonatomic)mareadust *modeldust;
@property(strong, nonatomic)garea *spatial;
@property(nonatomic)CGFloat centerx;
@property(nonatomic)CGFloat centery;

@end