#import "meffectitemshot.h"

static NSInteger const shotsize = 40;
static NSInteger const shotttl = 25;

@implementation meffectitemshot

-(instancetype)init:(meffect*)model x:(NSInteger)x y:(NSInteger)y
{
    self = [super init:model x:x y:y];
    CGFloat rotation = arc4random_uniform(360.0) * degtorad;
    self.spatial = [[geffect alloc] init:[mtextures singleton].textures_effectshot realx:x realy:y width:shotsize height:shotsize rotation:rotation];
    [self starttimer:shotttl];
    
    return self;
}

@end