#import "ggun.h"

@implementation ggun

-(instancetype)init
{
    self = [super init];
    self.active = NO;
    
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