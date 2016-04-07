#import "gspatialtexture.h"
#import "appdel.h"

@implementation gspatialtexture

-(instancetype)init
{
    self = [super init];
    self.image = [[gimage alloc] init];
    
    return self;
}

#pragma mark -
#pragma mark spatial

-(void)notifiedglkdraw:(NSNotification*)notification
{
    effect.texture2d0.enabled = YES;
    effect.texture2d0.envMode = GLKTextureEnvModeReplace;
    effect.texture2d0.name = self.image.current;
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, 0, pointertexture);
    
    [super notifiedglkdraw:notification];
    
    glDisableVertexAttribArray(GLKVertexAttribTexCoord0);
}

@end