#import "meffectitembombing.h"

static NSInteger const bombingttl = 35;

@implementation meffectitembombing

-(instancetype)init:(meffect*)model x:(NSInteger)x y:(NSInteger)y
{
    self = [super init:model x:x y:y];
    
    NSArray<NSNumber*> *assets = [mtextures singleton].textures_effectbombing;
    CGFloat rotation = arc4random_uniform(360.0) * degtorad;
    self.spatial = [[geffect alloc] init:assets realx:x realy:y size:effectbombingsize pos:effectbombingpos rotation:rotation];
    [self starttimer:bombingttl];
    
    return self;
}

@end