#import "meffectitemsmoke.h"

static NSInteger const smokettl = 60;

@implementation meffectitemsmoke

-(instancetype)init:(meffect*)model x:(NSInteger)x y:(NSInteger)y
{
    self = [super init:model x:x y:y];
    
    NSArray<NSNumber*> *assets = [mtextures singleton].textures_effectsmoke;
    CGFloat rotation = arc4random_uniform(360.0) * degtorad;
    self.spatial = [[geffect alloc] init:assets realx:x realy:y width:smokesize height:smokesize rotation:rotation];
    [self.spatial.image animationspeed:smokettl / assets.count];
    [self starttimer:smokettl];
    
    return self;
}

@end