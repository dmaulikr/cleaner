#import "gspatialtexture.h"

@interface gspatialtexture ()

@property(strong, nonatomic)NSMutableData *datatexture;

@end

@implementation gspatialtexture

-(instancetype)init
{
    self = [super init];
    self.image = [[gimage alloc] init];
    
    return self;
}

#pragma mark -
#pragma mark spatial

-(void)rasterize
{
    self.datatexture = [NSMutableData dataWithLength:vectorcorners * sizeof(GLKVector2)];
    self.pointertexture = self.datatexture.mutableBytes;
    self.pointertexture[0] = GLKVector2Make(0, 0);
    self.pointertexture[1] = GLKVector2Make(0, 1);
    self.pointertexture[2] = GLKVector2Make(1, 1);
    self.pointertexture[3] = GLKVector2Make(1, 1);
    self.pointertexture[4] = GLKVector2Make(1, 0);
    self.pointertexture[5] = GLKVector2Make(0, 0);
    
    [super rasterize];
}

-(void)draw:(GLKBaseEffect*)effect
{
    if(self.image.loading)
    {
        NSLog(@"shit");
    }
    
    effect.texture2d0.enabled = YES;
    effect.texture2d0.envMode = GLKTextureEnvModeReplace;
    effect.texture2d0.name = self.image.current;
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, 0, self.pointertexture);
    
    [super draw:effect];
    
    glDisableVertexAttribArray(GLKVertexAttribTexCoord0);
}

@end