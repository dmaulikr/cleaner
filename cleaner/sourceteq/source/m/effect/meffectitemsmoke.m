#import "meffectitemsmoke.h"

static CGFloat const smokesize = 50;
static NSInteger const smokettl = 60;

@implementation meffectitemsmoke

-(instancetype)init:(meffect*)model x:(CGFloat)x y:(CGFloat)y
{
    self = [super init:model x:x y:y];
    
    CGFloat smokesize_2 = smokesize / 2.0;
    self.assets = @[@"effect_smoke0", @"effect_smoke1", @"effect_smoke2", @"effect_smoke3"];
    self.spatial.x = -smokesize_2;
    self.spatial.y = -smokesize_2;
    self.spatial.width = smokesize;
    self.spatial.height = smokesize;
    self.spatial.rotation = arc4random_uniform(360.0) * M_PI / 180.0;
    self.spatial.image.speed = smokettl / self.assets.count;
    self.ttl = smokettl;
    
    [self rasterize];
    
    return self;
}
@end