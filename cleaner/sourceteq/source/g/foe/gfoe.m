#import "gfoe.h"

static NSUInteger const imagespeed = 180;

@implementation gfoe

-(instancetype)init:(mfoeitem*)model
{
    self = [super init];
    self.model = model;
    self.image.random = YES;
    self.image.srgb = YES;
    self.image.speed = imagespeed;
    self.delx = 0;
    self.dely = 0;

    return self;
}

-(void)draw:(GLKBaseEffect*)effect
{
    effect.texture2d0.enabled = YES;
    effect.texture2d0.envMode = GLKTextureEnvModeReplace;
    effect.texture2d0.name = self.image.current;
    effect.transform.projectionMatrix = GLKMatrix4MakeOrtho(self.delx, self.model.model.modelarea.screenwidth + self.delx, self.model.model.modelarea.screenheight + self.dely, self.dely, 1, -1);
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, 0, self.pointertexture);
    
    [super draw:effect];
    
    glDisableVertexAttribArray(GLKVertexAttribTexCoord0);
    
    effect.transform.projectionMatrix = GLKMatrix4MakeOrtho(0, self.model.model.modelarea.screenwidth, self.model.model.modelarea.screenheight, 0, 1, -1);
}

@end