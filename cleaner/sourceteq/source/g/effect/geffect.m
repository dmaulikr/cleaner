#import "geffect.h"
#import "meffectitem.h"

@implementation geffect
{
    GLKMatrix4 rotationmatrix;
}

-(instancetype)init:(NSArray<NSNumber*>*)textures realx:(NSInteger)realx realy:(NSInteger)realy size:(NSInteger)size pos:(NSInteger)pos rotation:(CGFloat)rotation
{
    self = [super init:textures];
    self.x = pos;
    self.y = pos;
    self.width = size;
    self.height = size;
    
    GLKMatrix4 transmat = GLKMatrix4MakeTranslation(realx, realy, 0);
    GLKMatrix4 rotmat = GLKMatrix4MakeRotation(rotation, 0, 0, 1);
    rotationmatrix = GLKMatrix4Multiply(transmat, rotmat);
    
    [self render];
    
    return self;
}

#pragma mark -
#pragma mark spatial

-(void)draw
{
    globaltransform.modelviewMatrix = rotationmatrix;
    
    [super draw];
    
    globaltransform.modelviewMatrix = rotationclear;
}

@end