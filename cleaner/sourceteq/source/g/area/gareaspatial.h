#import "appdel.h"
#import "gspatial.h"

@class marea;

@interface gareaspatial:gspatial

-(instancetype)init:(marea*)model;

@property(weak, nonatomic)marea *model;

@end