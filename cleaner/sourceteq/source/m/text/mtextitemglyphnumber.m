#import "mtextitemglyphnumber.h"

static NSString* const assetname = @"text_numbers";
static CGFloat const atlaswidth = 0.18604;
static CGFloat const atlasheight = 0.4651;
static CGFloat const marginhr = 0.03488;
static CGFloat const marginvr = 0.08139;
static CGFloat const glyphwidth = 24;
static CGFloat const glyphheight = 39;

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