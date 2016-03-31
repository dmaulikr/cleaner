#import "appdel.h"
#import "gspatialtexture.h"

@class mbuildingitem;

@interface gbuildingitem:gspatialtexture

-(instancetype)init:(mbuildingitem*)model;

@property(weak, nonatomic)mbuildingitem *model;

@end