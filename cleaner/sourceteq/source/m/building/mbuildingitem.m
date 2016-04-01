#import "mbuildingitem.h"

@implementation mbuildingitem

-(instancetype)init:(NSDictionary*)dictionary
{
    self = [super init];
    self.assetname = dictionary[@"asset"];
    self.spatial = [[gbuilding alloc] init:self];
    self.spatial.width = [dictionary[@"width"] floatValue];
    self.spatial.height = [dictionary[@"height"] floatValue];
    
    return self;
}

@end