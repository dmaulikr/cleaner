#import "appdel.h"

@class mgame;
@class mgamearea;

@interface cgameloader:UIViewController

-(void)loadingfinished;

@property(strong, nonatomic)mgame *model;
@property(nonatomic)BOOL firsttime;

@end