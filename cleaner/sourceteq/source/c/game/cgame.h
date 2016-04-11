#import "appdel.h"

@class mgame;

@interface cgame:GLKViewController<GLKViewControllerDelegate>

-(instancetype)init:(mgame*)model;
-(void)exitgame;
-(void)gameover;
-(void)gamefinished;

@property(strong, nonatomic)mgame *model;

@end