#import "appdel.h"

@class mtextures;
@class meffectitem;

@interface meffect:NSObject

-(instancetype)init:(mtextures*)modeltextures;
-(void)shotatx:(CGFloat)x y:(CGFloat)y;
-(void)smokeatx:(CGFloat)x y:(CGFloat)y;

@property(weak, nonatomic)mtextures *modeltextures;
@property(strong, nonatomic)NSMutableArray<meffectitem*> *items;

@end