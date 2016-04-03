#import "ggun.h"

static CGFloat const gunsize = 40;

@implementation ggun
{
    CGFloat gunsize_2;
}

-(instancetype)init
{
    self = [super init];
    self.active = NO;
    gunsize_2 = gunsize / 2.0;
    
    return self;
}

#pragma mark public

-(void)centerx:(NSInteger)x y:(NSInteger)y
{
    self.active = YES;
    self.width = gunsize;
    self.height = gunsize;
    self.x = x - gunsize_2;
    self.y = y - gunsize_2;
    
    [self render];
    [self movetotop];
}

#pragma mark -
#pragma mark gspatial

-(void)draw:(GLKBaseEffect*)effect
{
    if(self.active)
    {
        [super draw:effect];
    }
}

@end