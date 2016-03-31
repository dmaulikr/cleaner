#import "mbuildingitem.h"

@implementation mbuildingitem

-(instancetype)init:(NSDictionary*)dictionary x:(CGFloat)x y:(CGFloat)y
{
    self = [super init];
    self.spatial = [[gbuildingitem alloc] init:self];
    self.assetname = dictionary[@"asset"];
    self.spatial.x = x;
    self.spatial.y = y;
    self.spatial.width = [dictionary[@"width"] floatValue];
    self.spatial.height = [dictionary[@"height"] floatValue];
    
    return self;
}

@end