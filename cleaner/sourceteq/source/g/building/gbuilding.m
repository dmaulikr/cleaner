#import "gbuilding.h"

@implementation gbuilding

-(instancetype)init:(mbuildingitem*)model
{
    self = [super init];
    self.model = model;
    self.color = GLKVector4Make(1, 1, 1, 0);
    self.image.srgb = YES;
    [self.image loadtextures:@[model.assetname]];
    
    return self;
}

@end