#import <UIKit/UIKit.h>

@class meffect;
@class geffect;

@interface meffectitem:NSObject

-(instancetype)init:(meffect*)model x:(NSInteger)x y:(NSInteger)y;
-(void)starttimer:(NSInteger)newttl;

@property(weak, nonatomic)meffect *model;
@property(strong, nonatomic)geffect *spatial;
@property(strong, nonatomic)NSArray *assets;

@end