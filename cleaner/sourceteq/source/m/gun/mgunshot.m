#import "mgunshot.h"

@implementation mgunshot

-(instancetype)init:(NSInteger)caliber minx:(NSInteger)minx miny:(NSInteger)miny maxx:(NSInteger)maxx maxy:(NSInteger)maxy
{
    self = [super init];
    self.caliber = caliber;
    self.minx = minx;
    self.miny = miny;
    self.maxx = maxx;
    self.maxy = maxy;
    
    return self;
}

@end