#import "geffect.h"
#import "meffectitem.h"

@implementation geffect

-(instancetype)init:(meffectitem*)model
{
    self = [super init];
    self.model = model;
    self.image.srgb = YES;
    [self.image loadtextures:@[model.assetname]];
    
    return self;
}

@end