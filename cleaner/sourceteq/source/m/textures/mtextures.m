#import "mtextures.h"

@implementation mtextures

-(instancetype)init
{
    self = [super init];
    self.textures = [NSMutableDictionary dictionary];
    
    return self;
}

-(void)dealloc
{
    
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