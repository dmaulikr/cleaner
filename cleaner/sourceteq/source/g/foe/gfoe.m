#import "gfoe.h"

static NSUInteger const imagespeed = 180;

@implementation gfoe

-(instancetype)init:(mfoeitem*)model
{
    self = [super init];
    self.model = model;
    self.image.random = YES;
    self.image.srgb = YES;
    self.image.speed = imagespeed;

    return self;
}

@end