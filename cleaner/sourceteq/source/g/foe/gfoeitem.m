#import "gfoeitem.h"
#import "gfoeshadow.h"

@implementation gfoeitem

-(instancetype)init:(mfoeitem*)model
{
    self = [super init];
    self.model = model;
    self.image.random = YES;
    self.image.srgb = YES;
    self.image.speed = 180;
    self.shadow = [[gfoeshadow alloc] init];
    
    return self;
}

#pragma mark -
#pragma mark spatial

-(void)render
{
    CGFloat currentfloat2 = currentfloat * 2;
    CGFloat shadowheight = maxshadowheight - currentfloat;
    
    if(shadowheight < 0)
    {
        shadowheight = 0;
    }
    
    self.shadow.x = self.x + currentfloat;
    self.shadow.y = self.y;
    self.shadow.width = self.width - currentfloat2;
    self.shadow.height = shadowheight;
    
    [super render];
    [self.shadow render];
}

-(void)draw:(GLKBaseEffect*)effect
{
    [self.shadow draw:effect];
    [super draw:effect];
}

-(void)screenmovedx:(CGFloat)x y:(CGFloat)y
{
    self.x -= x;
    self.y -= y;
    self.visualy -= y;
}

@end