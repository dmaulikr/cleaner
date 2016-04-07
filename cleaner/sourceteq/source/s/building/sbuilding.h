#import "appdel.h"

@class mbuilding;

@interface sbuilding:NSObject

-(instancetype)init:(mbuilding*)model;

@property(weak, nonatomic)mbuilding *model;

@end