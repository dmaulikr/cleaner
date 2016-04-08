#import "gspatialtexture.h"
#import "appdel.h"

@implementation gspatialtexture
{
    gimage *image;
}

-(instancetype)init:(NSArray<NSNumber*>*)assets
{
    self = [super init];
    image = [[gimage alloc] init:assets];
    
    return self;
}

#pragma mark public

-(gimage*)image
{
    return image;
}

#pragma mark -
#pragma mark spatial

-(void)draw
{
    globaltexture.enabled = YES;
    globaltexture.envMode = GLKTextureEnvModeReplace;
    globaltexture.name = image.current;
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, 0, pointertexture);
    
    [super draw];
    
    glDisableVertexAttribArray(GLKVertexAttribTexCoord0);
}

@end