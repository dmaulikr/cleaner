#import "meffectitemshot.h"

static NSString* const shotasset = @"effect_shot";
static CGFloat const shotwidth = 20;
static CGFloat const shotheight = 20;

@implementation meffectitemshot

-(instancetype)init:(meffect*)model x:(CGFloat)x y:(CGFloat)y
{
    self = [super init:model x:x y:y];
    self.assetname = shotasset;
    self.spatial.width = shotwidth;
    self.spatial.height = shotheight;
    self.ttl = 500;
    
    [self rasterize];
    
    return self;
}

@end