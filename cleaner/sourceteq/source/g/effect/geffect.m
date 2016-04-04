#import "geffect.h"

@implementation geffect

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