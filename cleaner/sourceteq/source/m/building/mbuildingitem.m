#import "mbuildingitem.h"

@implementation mbuildingitem

-(instancetype)init:(NSDictionary*)dictionary x:(CGFloat)x y:(CGFloat)y
{
    self = [super init];
    self.assetname = dictionary[@"asset"];
    self.spatial = [[gbuilding alloc] init:self];
    self.spatial.x = x;
    self.spatial.y = y;
    self.spatial.width = [dictionary[@"width"] floatValue];
    self.spatial.height = [dictionary[@"height"] floatValue];
    [self.spatial rasterize];
    
    return self;
}

@end