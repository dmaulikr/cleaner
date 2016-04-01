#import "appdel.h"

@class mgame;

@interface cgame:GLKViewController<GLKViewControllerDelegate>

-(instancetype)init:(mgame*)model;
-(void)exitgame;

@property(strong, nonatomic)mgame *model;

@end