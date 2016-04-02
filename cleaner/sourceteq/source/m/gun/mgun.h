#import "appdel.h"

@class marea;
@class ggunpointer;
@class gguntarget;

@interface mgun:NSObject

-(instancetype)init:(marea*)modelarea;
-(void)movetox:(NSInteger)x y:(NSInteger)y;

@property(weak, nonatomic)marea *modelarea;
@property(strong, nonatomic)gguntarget *spatialtarget;
@property(strong, nonatomic)ggunpointer *spatialpointer;
@property(nonatomic)NSInteger x;
@property(nonatomic)NSInteger y;

@end