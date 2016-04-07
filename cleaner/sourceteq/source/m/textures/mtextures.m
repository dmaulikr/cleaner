#import "mtextures.h"

@implementation mtextures

+(instancetype)singleton
{
    static mtextures *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

#pragma mark functionality

-(NSNumber*)textureforasset:(NSString*)asset srgb:(BOOL)srgb
{
    NSNumber *number;
    UIImage *image = [UIImage imageNamed:asset];
    GLKTextureInfo *textureinfo = [GLKTextureLoader textureWithCGImage:image.CGImage options:@{GLKTextureLoaderSRGB:@(srgb)} error:nil];
    GLuint texture = textureinfo.name;
    number = @(texture);
    self.textures[asset] = number;
    
    return number;
}

#pragma mark public

-(void)cleartextures
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
    
#warning "check"
}

-(void)loadtextures:(NSArray<NSDictionary*>*)rawtextures
{
    self.textures = [NSMutableDictionary dictionary];
    NSUInteger count = rawtextures.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        NSDictionary *rawtexture = rawtextures[i];
        NSString *asset = rawtexture[@"asset"];
        BOOL srgb = [rawtexture[@"srgb"] boolValue];
        NSNumber *texture = [self textureforasset:asset srgb:srgb];
        
        self.textures[asset] = texture;
    }
}

@end