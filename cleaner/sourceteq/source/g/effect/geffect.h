#import "appdel.h"
#import "gspatialtexture.h"

@class meffectitem;

@interface geffect:gspatialtexture

-(instancetype)init:(meffectitem*)model;

@property(weak, nonatomic)meffectitem *model;
@property(nonatomic)CGFloat realx;
@property(nonatomic)CGFloat realy;
@property(nonatomic)CGFloat rotation;

@end