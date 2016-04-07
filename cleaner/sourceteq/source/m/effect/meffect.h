#import "appdel.h"

@class meffectitem;

@interface meffect:NSObject

-(void)shotatx:(NSInteger)x y:(NSInteger)y;
-(void)smokeatx:(NSInteger)x y:(NSInteger)y;

@property(strong, nonatomic)NSMutableArray<meffectitem*> *items;

@end