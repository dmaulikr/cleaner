#import "mtextures.h"

@interface mtextures ()

@property(strong, nonatomic)NSMutableArray<NSArray*> *alltextures;

@end

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
    
    return number;
}

-(NSArray*)loadforassets:(NSArray*)assets srgb:(BOOL)srgb
{
    NSMutableArray *textures = [NSMutableArray array];
    NSUInteger count = assets.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        NSDictionary *rawtexture = assets[i];
        NSString *asset = rawtexture[@"asset"];
        NSNumber *texture = [self textureforasset:asset srgb:srgb];
        [textures addObject:texture];
    }
    
    return textures;
}

-(void)load_areadust
{
    self.textures_areadust = [self loadforassets:@[@"area_dust"] srgb:YES];
    [self.alltextures addObject:self.textures_areadust];
}

-(void)load_building0
{
    self.textures_building0 = [self loadforassets:@[@"building0"] srgb:YES];
    [self.alltextures addObject:self.textures_building0];
}

-(void)load_building1
{
    self.textures_building1 = [self loadforassets:@[@"building1"] srgb:YES];
    [self.alltextures addObject:self.textures_building1];
}

-(void)load_foeinvader
{
    self.textures_foeinvader = [self loadforassets:@[@"foe_invader0", @"foe_invader1", @"foe_invader2"] srgb:YES];
    [self.alltextures addObject:self.textures_foeinvader];
}

-(void)load_foeocto
{
    self.textures_foeocto = [self loadforassets:@[@"foe_octo0", @"foe_octo1", @"foe_octo2"] srgb:YES];
    [self.alltextures addObject:self.textures_foeocto];
}

-(void)load_gunpointer
{
    self.textures_gunpointer = [self loadforassets:@[@"gun_pointer"] srgb:YES];
    [self.alltextures addObject:self.textures_gunpointer];
}

-(void)load_guntarget
{
    self.textures_guntarget = [self loadforassets:@[@"gun_target"] srgb:YES];
    [self.alltextures addObject:self.textures_guntarget];
}

-(void)load_gunfinger
{
    self.textures_gunfinger = [self loadforassets:@[@"gun_finger"] srgb:YES];
    [self.alltextures addObject:self.textures_gunfinger];
}

-(void)load_effectshot
{
    self.textures_effectshot = [self loadforassets:@[@"effect_shot"] srgb:YES];
    [self.alltextures addObject:self.textures_effectshot];
}

-(void)load_effectsmoke
{
    self.textures_effectsmoke = [self loadforassets:@[@"effect_smoke0", @"effect_smoke1", @"effect_smoke2", @"effect_smoke3"] srgb:YES];
    [self.alltextures addObject:self.textures_effectsmoke];
}

-(void)load_textnumbers
{
    self.textures_textnumbers = [self loadforassets:@[@"text_numbers"] srgb:NO];
    [self.alltextures addObject:self.textures_textnumbers];
}

-(void)load_hublife
{
    self.textures_hublife = [self loadforassets:@[@"hub_life"] srgb:YES];
    [self.alltextures addObject:self.textures_hublife];
}

#pragma mark public

-(void)cleartextures
{
    NSUInteger counter = self.alltextures.count;
    
    for(NSInteger i = 0; i < counter; i++)
    {
        NSArray *inner = self.alltextures[i];
        NSUInteger incounter = inner.count;
        
        for(NSUInteger j = 0; j < incounter; j++)
        {
            NSNumber *texture = inner[j];
            GLuint reference = texture.unsignedIntValue;
            glDeleteTextures(1, &reference);
        }
    }
}

-(void)loadtextures
{
    self.alltextures = [NSMutableArray array];
    [self load_areadust];
    [self load_building0];
    [self load_building1];
    [self load_foeinvader];
    [self load_foeocto];
    [self load_gunpointer];
    [self load_guntarget];
    [self load_gunfinger];
    [self load_effectshot];
    [self load_effectsmoke];
    [self load_textnumbers];
    [self load_hublife];
}

@end