#import <UIKit/UIKit.h>

@class meffect;
@class geffect;

@interface meffectitem:NSObject

-(instancetype)init:(meffect*)model x:(CGFloat)x y:(CGFloat)y;
-(void)rasterize;

@property(weak, nonatomic)meffect *model;
@property(strong, nonatomic)geffect *spatial;
@property(strong, nonatomic)NSArray *assets;
@property(nonatomic)NSInteger ttl;

@end