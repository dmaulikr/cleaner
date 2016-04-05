#import "meffectitemshot.h"

static NSString* const shotasset = @"effect_shot";
static CGFloat const shotsize = 40;
static NSInteger const shotttl = 25;

@implementation meffectitemshot

-(instancetype)init:(meffect*)model x:(CGFloat)x y:(CGFloat)y
{
    self = [super init:model x:x y:y];
    
    CGFloat shotsize_2 = shotsize / 2.0;
    self.assetname = shotasset;
    self.spatial.x = -shotsize_2;
    self.spatial.y = -shotsize_2;
    self.spatial.width = shotsize;
    self.spatial.height = shotsize;
    self.spatial.rotation = arc4random_uniform(360.0) * M_PI / 180.0;
    self.ttl = shotttl;
    
    [self rasterize];
    
    return self;
}

@end