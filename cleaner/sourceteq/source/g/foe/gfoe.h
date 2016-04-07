#import "appdel.h"
#import "gspatialtexture.h"

@class mfoeitem;

@interface gfoe:gspatialtexture

-(instancetype)init:(mfoeitem*)model;

@property(weak, nonatomic)mfoeitem *model;
@property(nonatomic)CGFloat delx;
@property(nonatomic)CGFloat dely;

@end