#import "gspatialtexture.h"
#import "appdel.h"

@interface gspatialtexture ()

@property(strong, nonatomic)gimage *image;

@end

@implementation gspatialtexture

-(instancetype)init:(NSArray<NSString*>*)assets
{
    self = [super init];
    self.image = [[gimage alloc] init:assets];
    
    return self;
}

#pragma mark -
#pragma mark spatial

-(void)draw
{
    effect.texture2d0.enabled = YES;
    effect.texture2d0.envMode = GLKTextureEnvModeReplace;
    effect.texture2d0.name = self.image.current;
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, 0, pointertexture);
    
    [super draw];
    
    glDisableVertexAttribArray(GLKVertexAttribTexCoord0);
}

@end