#import "geffect.h"
#import "meffectitem.h"

@implementation geffect

-(instancetype)init:(meffectitem*)model
{
    self = [super init];
    self.model = model;
    self.image.srgb = YES;
    
    return self;
}

#pragma mark -
#pragma mark spatial

-(void)rasterize
{
    [self.image loadtextures:@[self.model.assetname]];
    [super rasterize];
}

@end