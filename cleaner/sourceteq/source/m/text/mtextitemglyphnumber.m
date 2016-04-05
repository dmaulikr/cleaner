#import "mtextitemglyphnumber.h"

static NSString* const assetname = @"text_numbers";
static CGFloat const atlaswidth = 0.18604;
static CGFloat const atlasheight = 0.4651;
static CGFloat const marginhr = 0.03488;
static CGFloat const marginvr = 0.08139;
static NSInteger const glyphwidth = 24;
static NSInteger const glyphheight = 39;

@implementation mtextitemglyphnumber

+(instancetype)number:(NSUInteger)number x:(NSInteger)x y:(NSInteger)y
{
    CGFloat left = (number % 5) * atlaswidth;
    CGFloat top = (number / 5) * atlasheight;
    left += marginhr;
    top += marginvr;
    
    mtextitemglyphnumber *glyph = [[mtextitemglyphnumber alloc] init];
    glyph.x = x;
    glyph.y = y;
    glyph.leftmargin = left;
    glyph.topmargin = top;
    glyph.atlaswidth = atlaswidth + left;
    glyph.atlasheight = atlasheight + top;
    [glyph rasterize];
    
    return glyph;
}

-(instancetype)init
{
    self = [super init];
    self.width = glyphwidth;
    self.height = glyphheight;
    self.assetname = assetname;
    
    return self;
}

@end