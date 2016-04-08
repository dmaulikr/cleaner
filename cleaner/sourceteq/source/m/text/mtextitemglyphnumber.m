#import "mtextitemglyphnumber.h"

static NSInteger const glyphwidth = 40;
static NSInteger const glyphheight = 50;

@implementation mtextitemglyphnumber

-(instancetype)init:(NSString*)character x:(NSInteger)x y:(NSInteger)y size:(CGFloat)size
{
    self = [super init:character x:x y:y size:size];
    NSInteger width = glyphwidth * size;
    NSInteger height = glyphheight * size;
    NSUInteger number = character.integerValue;
    NSArray<NSNumber*> *textures;
    
    switch(number)
    {
        case 0:
            
            textures = [mtextures singleton].textures_text0;
            
            break;
            
        case 1:
            
            textures = [mtextures singleton].textures_text1;
            
            break;
            
        case 2:
            
            textures = [mtextures singleton].textures_text2;
            
            break;
            
        case 3:
            
            textures = [mtextures singleton].textures_text3;
            
            break;
            
        case 4:
            
            textures = [mtextures singleton].textures_text4;
            
            break;
            
        case 5:
            
            textures = [mtextures singleton].textures_text5;
            
            break;
            
        case 6:
            
            textures = [mtextures singleton].textures_text6;
            
            break;
            
        case 7:
            
            textures = [mtextures singleton].textures_text7;
            
            break;
            
        case 8:
            
            textures = [mtextures singleton].textures_text8;
            
            break;
            
        case 9:
            
            textures = [mtextures singleton].textures_text9;
            break;
    }
    
    self.spatial = [[gtext alloc] init:textures x:x y:y width:width height:height];
    
    return self;
}

@end