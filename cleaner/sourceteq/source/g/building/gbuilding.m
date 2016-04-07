#import "gbuilding.h"

@implementation gbuilding

-(instancetype)init:(mbuildingitem*)model
{
    self = [super init];
    self.model = model;
    self.image.srgb = YES;
    [self.image loadtextures:@[model.assetname] model:model.modeltextures];
    
    return self;
}

@end