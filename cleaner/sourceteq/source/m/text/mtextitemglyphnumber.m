#import "mtextitemglyphnumber.h"

static NSInteger const glyphwidth = 40;
static NSInteger const glyphheight = 50;

@implementation mtextitemglyphnumber

-(instancetype)init:(mtextures*)modeltextures character:(NSString*)character x:(NSInteger)x y:(NSInteger)y size:(CGFloat)size
{
    self = [super init:modeltextures character:character x:x y:y size:size];
    self.width = glyphwidth * size;
    self.height = glyphheight * size;
    self.assetname = assetname;
    
    NSUInteger number = character.integerValue;
    CGFloat left = (number % 5) * atlaswidth;
    CGFloat top = (number / 5) * atlasheight;
    left += marginhr;
    top += marginvr;
    
    self.leftmargin = left;
    self.topmargin = top;
    self.atlaswidth = atlaswidth + left;
    self.atlasheight = atlasheight + top;
    [self rasterize];
    
    return self;
}

@end