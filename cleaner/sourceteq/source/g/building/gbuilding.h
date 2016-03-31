#import "appdel.h"
#import "gspatialtexture.h"

@class mbuildingitem;

@interface gbuilding:gspatialtexture

-(instancetype)init:(mbuildingitem*)model;

@property(weak, nonatomic)mbuildingitem *model;

@end