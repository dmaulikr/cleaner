#import "appdel.h"

@interface mgunshot:NSDictionary

-(instancetype)init:(NSInteger)caliber minx:(NSInteger)minx miny:(NSInteger)miny maxx:(NSInteger)maxx maxy:(NSInteger)maxy;

@property(nonatomic)NSInteger caliber;
@property(nonatomic)NSInteger minx;
@property(nonatomic)NSInteger miny;
@property(nonatomic)NSInteger maxx;
@property(nonatomic)NSInteger maxy;

@end