#import "ggun.h"

@implementation ggun

-(instancetype)init:(mtextures*)modeltextures
{
    self = [super init];
    self.active = NO;
    
    return self;
}

#pragma mark public

-(void)initialx:(NSInteger)x y:(NSInteger)y width:(NSInteger)width height:(NSInteger)height
{
    self.active = YES;
    self.x = x;
    self.y = y;
    self.width = width;
    self.height = height;
    
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