#import "appdel.h"
#import "gspatialtexture.h"

@class meffectitem;

@interface geffect:gspatialtexture

-(instancetype)init:(meffectitem*)model;

@property(weak, nonatomic)meffectitem *model;

@end