#import "mtextures.h"

@implementation mtextures

+(instancetype)singleton
{
    static mtextures *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
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

-(void)loadtextures:(NSArray<NSDictionary<NSString*, NSNumber*>*>*)rawtextures
{
    self.textures = [NSMutableDictionary dictionary];
}

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