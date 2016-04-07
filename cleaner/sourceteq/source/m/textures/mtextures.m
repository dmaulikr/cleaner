#import "mtextures.h"

GLKVector2 *pointertexture;

@implementation mtextures

-(instancetype)init
{
    self = [super init];
    self.textures = [NSMutableDictionary dictionary];
    
    self.datatexture = [NSMutableData dataWithLength:vectorcorners * sizeof(GLKVector2)];
    pointertexture = self.datatexture.mutableBytes;
    pointertexture[0] = GLKVector2Make(0, 0);
    pointertexture[1] = GLKVector2Make(0, 1);
    pointertexture[2] = GLKVector2Make(1, 1);
    pointertexture[3] = GLKVector2Make(1, 1);
    pointertexture[4] = GLKVector2Make(1, 0);
    pointertexture[5] = GLKVector2Make(0, 0);
    
    return self;
}

-(void)dealloc
{
    NSArray<NSNumber*> *textures = self.textures.allValues;
    NSUInteger counter = textures.count;
    
    for(NSInteger i = counter - 1; i >= 0; i--)
    {
        GLuint current = [textures[i] unsignedIntValue];
        glDeleteTextures(1, &current);
    }
    
    textures = nil;
    [self.textures removeAllObjects];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
#warning "check"
}

#pragma mark public

-(NSNumber*)textureforasset:(NSString*)asset srgb:(BOOL)srgb
{
    NSNumber *number = self.textures[asset];
    
    if(!number)
    {
        UIImage *image = [UIImage imageNamed:asset];
        GLKTextureInfo *textureinfo = [GLKTextureLoader textureWithCGImage:image.CGImage options:@{GLKTextureLoaderSRGB:@(srgb)} error:nil];
        GLuint texture = textureinfo.name;
        number = @(texture);
        self.textures[asset] = number;
    }
    
    return number;
}

@end