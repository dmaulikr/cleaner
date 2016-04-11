#import "appdel.h"

static NSInteger const effectshotsize = 40;
static NSInteger const effectsmokesize = 50;

extern NSInteger effectshotpos;
extern NSInteger effectsmokepos;

@class meffectitem;

@interface meffect:NSObject

-(void)shotatx:(NSInteger)x y:(NSInteger)y;
-(void)smokeatx:(NSInteger)x y:(NSInteger)y;
-(void)crownat:(NSInteger)x;

@property(strong, nonatomic)NSMutableArray<meffectitem*> *items;

@end