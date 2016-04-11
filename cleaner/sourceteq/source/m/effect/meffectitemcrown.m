#import "meffectitemcrown.h"

static NSInteger const crownttl = 300;

@implementation meffectitemcrown

-(instancetype)init:(meffect*)model x:(NSInteger)x y:(NSInteger)y
{
    self = [super init:model x:x y:y];
    
    NSArray<NSNumber*> *assets = [mtextures singleton].textures_effectcrown;
    self.spatial = [[geffect alloc] init:assets realx:x realy:y size:effectcrownsize pos:effectcrownsize rotation:0];
    [self.spatial.image animationspeed:crownttl / assets.count];
    [self starttimer:crownttl];
    
    return self;
}

@end