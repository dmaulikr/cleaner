#import "appdel.h"
#import "gspatialgradient.h"

@class marea;

@interface gareaspatial:gspatialgradient

-(instancetype)init:(marea*)model;

@property(weak, nonatomic)marea *model;

@end