#import <UIKit/UIKit.h>

@class meffect;
@class geffect;

@interface meffectitem:NSObject

-(instancetype)init:(meffect*)model x:(CGFloat)x y:(CGFloat)y;

@property(weak, nonatomic)meffect *model;
@property(strong, nonatomic)geffect *spatial;
@property(copy, nonatomic)NSString *assetname;

@end