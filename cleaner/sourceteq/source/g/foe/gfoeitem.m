#import "gfoeitem.h"

@implementation gfoeitem

-(instancetype)init:(mfoeitem*)model
{
    self = [super init];
    self.model = model;
    self.image.random = YES;
    self.image.srgb = YES;
    self.image.speed = 180;

    return self;
}

@end