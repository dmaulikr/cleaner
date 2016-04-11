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
        NSString *asset = assets[i];
        NSNumber *texture = [self textureforasset:asset srgb:srgb];
        [textures addObject:texture];
    }
    
    return textures;
}

-(void)load_area
{
    self.textures_areadust = [self loadforassets:@[@"area_dust"] srgb:YES];
    [self.alltextures addObject:self.textures_areadust];
}

-(void)load_buildings
{
    self.textures_buildingalpha = [self loadforassets:@[@"building_alpha"] srgb:YES];
    [self.alltextures addObject:self.textures_buildingalpha];
    
    self.textures_buildingbeta = [self loadforassets:@[@"building_beta"] srgb:YES];
    [self.alltextures addObject:self.textures_buildingbeta];
}

-(void)load_foes
{
    self.textures_foeinvader = [self loadforassets:@[@"foe_invader0", @"foe_invader1", @"foe_invader2"] srgb:YES];
    [self.alltextures addObject:self.textures_foeinvader];
    
    self.textures_foeocto = [self loadforassets:@[@"foe_octo0", @"foe_octo1", @"foe_octo2"] srgb:YES];
    [self.alltextures addObject:self.textures_foeocto];
}

-(void)load_gun
{
    self.textures_gunpointer = [self loadforassets:@[@"gun_pointer"] srgb:YES];
    [self.alltextures addObject:self.textures_gunpointer];
    
    self.textures_guntarget = [self loadforassets:@[@"gun_target"] srgb:YES];
    [self.alltextures addObject:self.textures_guntarget];
    
    self.textures_gunfinger = [self loadforassets:@[@"gun_finger"] srgb:YES];
    [self.alltextures addObject:self.textures_gunfinger];
}

-(void)load_effects
{
    self.textures_effectshot = [self loadforassets:@[@"effect_shot"] srgb:YES];
    [self.alltextures addObject:self.textures_effectshot];
    
    self.textures_effectsmoke = [self loadforassets:@[@"effect_smoke0", @"effect_smoke1", @"effect_smoke2", @"effect_smoke3"] srgb:YES];
    [self.alltextures addObject:self.textures_effectsmoke];
    
    self.textures_effectcrown = [self loadforassets:@[@"effect_crown0", @"effect_crown1", @"effect_crown2", @"effect_crown3", @"effect_crown4"] srgb:YES];
    [self.alltextures addObject:self.textures_effectcrown];
}

-(void)load_hub
{
    self.textures_hublife = [self loadforassets:@[@"hub_life"] srgb:YES];
    [self.alltextures addObject:self.textures_hublife];
}

-(void)load_text
{
    self.textures_text0 = [self loadforassets:@[@"text_0"] srgb:NO];
    [self.alltextures addObject:self.textures_text0];
    
    self.textures_text1 = [self loadforassets:@[@"text_1"] srgb:NO];
    [self.alltextures addObject:self.textures_text1];
    
    self.textures_text2 = [self loadforassets:@[@"text_2"] srgb:NO];
    [self.alltextures addObject:self.textures_text2];
    
    self.textures_text3 = [self loadforassets:@[@"text_3"] srgb:NO];
    [self.alltextures addObject:self.textures_text3];
    
    self.textures_text4 = [self loadforassets:@[@"text_4"] srgb:NO];
    [self.alltextures addObject:self.textures_text4];
    
    self.textures_text5 = [self loadforassets:@[@"text_5"] srgb:NO];
    [self.alltextures addObject:self.textures_text5];
    
    self.textures_text6 = [self loadforassets:@[@"text_6"] srgb:NO];
    [self.alltextures addObject:self.textures_text6];
    
    self.textures_text7 = [self loadforassets:@[@"text_7"] srgb:NO];
    [self.alltextures addObject:self.textures_text7];
    
    self.textures_text8 = [self loadforassets:@[@"text_8"] srgb:NO];
    [self.alltextures addObject:self.textures_text8];
    
    self.textures_text9 = [self loadforassets:@[@"text_9"] srgb:NO];
    [self.alltextures addObject:self.textures_text9];
}

-(void)load_trap
{
    self.textures_trapbomb = [self loadforassets:@[@"trap_bomb"] srgb:NO];
    [self.alltextures addObject:self.textures_trapbomb];
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
    [self load_area];
    [self load_buildings];
    [self load_foes];
    [self load_gun];
    [self load_effects];
    [self load_hub];
    [self load_text];
    [self load_trap];
}

@end