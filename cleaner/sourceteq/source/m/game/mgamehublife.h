#import "appdel.h"

@class cgame;

@interface mgamehublife:NSObject

-(void)receivedamage:(NSInteger)amount;

@property(weak, nonatomic)cgame *controller;
@property(nonatomic)NSInteger amount;

@end