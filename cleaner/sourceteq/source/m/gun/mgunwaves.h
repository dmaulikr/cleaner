#import "appdel.h"

@class ggunwaves;

@interface mgunwaves:NSObject

-(void)restart:(NSInteger)initx inity:(NSInteger)inity centerx:(NSInteger)centerx centery:(NSInteger)centery finalx:(NSInteger)finalx finaly:(NSInteger)finaly pointermargin:(NSInteger)pointermargin;
-(void)clear;

@property(strong, nonatomic)NSMutableArray<ggunwaves*> *items;

@end