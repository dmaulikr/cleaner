#import "ggun.h"

@implementation ggun
{
    BOOL active;
}

-(instancetype)init:(NSArray<NSNumber*>*)textures x:(NSInteger)x y:(NSInteger)y width:(NSInteger)width height:(NSInteger)height
{
    self = [super init:textures];
    self.x = x;
    self.y = y;
    self.width = width;
    self.height = height;
    active = NO;
    
    [self render];
    
    return self;
}

#pragma mark public

-(void)deacivate
{
    active = NO;
}

-(void)makeactive
{
    active = YES;
}

#pragma mark -
#pragma mark gspatial

-(void)draw
{
    if(active)
    {
        [super draw];
    }
}

@end