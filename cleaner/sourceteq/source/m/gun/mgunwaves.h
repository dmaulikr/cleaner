#import "appdel.h"

@class ggunwaves;

@interface mgunwaves:NSObject

-(void)restart:(CGFloat)initx inity:(CGFloat)inity centerx:(CGFloat)centerx centery:(CGFloat)centery finalx:(CGFloat)finalx finaly:(CGFloat)finaly pointermargin:(NSInteger)pointermargin;
-(void)clear;

@property(strong, nonatomic)NSMutableArray<ggunwaves*> *items;

@end