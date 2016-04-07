#import "meffectitemsmoke.h"

static NSInteger const smokesize = 50;
static NSInteger const smokettl = 60;

@implementation meffectitemsmoke

-(instancetype)init:(meffect*)model x:(NSInteger)x y:(NSInteger)y
{
    self = [super init:model x:x y:y];
    CGFloat rotation = arc4random_uniform(360.0) * M_PI / 180.0;
    self.spatial = [[geffect alloc] init:[mtextures singleton].textures_effectsmoke realx:x realy:y width:smokesize height:smokesize rotation:rotation];
    self.spatial.image.speed = smokettl / [mtextures singleton].textures_effectsmoke.count;
    [self starttimer:smokettl];
    
    return self;
}

@end