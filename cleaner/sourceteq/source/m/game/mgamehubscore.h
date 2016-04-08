#import "appdel.h"

@class mtext;

@interface mgamehubscore:NSObject

-(instancetype)init:(mtext*)newmodel;
-(void)addscore:(NSUInteger)addscore;

@end