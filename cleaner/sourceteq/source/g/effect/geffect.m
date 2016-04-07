#import "geffect.h"
#import "meffectitem.h"

@implementation geffect
{
    GLKMatrix4 rotationmatrix;
    CGFloat rotation;
    NSInteger realx;
    NSInteger realy;
}

-(instancetype)init:(NSArray<NSNumber*>*)textures realx:(NSInteger)newrealx realy:(NSInteger)newrealy width:(NSInteger)width height:(NSInteger)height rotation:(CGFloat)newrotation
{
    self = [super init:textures];
    realx = newrealx;
    realy = newrealy;
    rotation = newrotation;
    self.x = width / -2.0;
    self.y = height / -2.0;
    self.width = width;
    self.height = height;
    [self render];
    
    return self;
}

#pragma mark -
#pragma mark spatial

-(void)render
{
    rotationmatrix = GLKMatrix4Multiply(GLKMatrix4MakeTranslation(realx, realy, 0), GLKMatrix4MakeRotation(rotation, 0, 0, 1));
    
    [super render];
}

-(void)draw
{
    effect.transform.modelviewMatrix = rotationmatrix;
    
    [super draw];
    
    effect.transform.modelviewMatrix = rotationclear;
}


@end