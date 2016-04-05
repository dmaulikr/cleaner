#import "geffect.h"
#import "meffectitem.h"

@interface geffect ()

@property(nonatomic)GLKMatrix4 rotationmatrix;
@property(nonatomic)GLKMatrix4 rotationclear;

@end

@implementation geffect

-(instancetype)init:(meffectitem*)model
{
    self = [super init];
    self.model = model;
    self.image.srgb = YES;
    
    return self;
}

#pragma mark -
#pragma mark spatial

-(void)rasterize
{
    [self.image loadtextures:self.model.assets];
    self.rotationmatrix = GLKMatrix4Multiply(GLKMatrix4MakeTranslation(self.realx, self.realy, 0), GLKMatrix4MakeRotation(self.rotation, 0, 0, 1));
    self.rotationclear = GLKMatrix4MakeRotation(0, 0, 0, 1);
    [super rasterize];
}

-(void)draw:(GLKBaseEffect*)effect
{
    effect.transform.modelviewMatrix = self.rotationmatrix;
    [super draw:effect];
    effect.transform.modelviewMatrix = self.rotationclear;
}


@end