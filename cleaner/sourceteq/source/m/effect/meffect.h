#import "appdel.h"

@class meffectitem;

@interface meffect:NSObject

-(void)shotatx:(CGFloat)x y:(CGFloat)y;

@property(strong, nonatomic)NSMutableArray<meffectitem*> *items;

@end