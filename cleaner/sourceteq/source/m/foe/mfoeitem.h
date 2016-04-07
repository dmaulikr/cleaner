#import "appdel.h"

@class gfoe;
@class mfoe;

@interface mfoeitem:NSObject

-(instancetype)init:(NSDictionary*)dictionary model:(mfoe*)model;

@property(strong, nonatomic)gfoe *spatial;
@property(weak, nonatomic)mfoe *model;
@property(nonatomic)NSInteger life;
@property(nonatomic)NSUInteger score;

@end