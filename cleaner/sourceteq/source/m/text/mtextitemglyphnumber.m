#import "mtextitemglyphnumber.h"

static NSString* const assetname = @"text_numbers";
static CGFloat const atlaswidth = 5.375;
static CGFloat const atlasheight = 2.5294;
static NSInteger const glyphwidth = 24;
static NSInteger const glyphheight = 34;
static NSInteger const marginhr = 6;
static NSInteger const marginvr = 7;

@implementation mtextitemglyphnumber

+(instancetype)number:(NSUInteger)number x:(NSInteger)x y:(NSInteger)y
{
    mtextitemglyphnumber *glyph = [[mtextitemglyphnumber alloc] init];
    glyph.x = x;
    glyph.y = y;
    glyph.leftmargin = marginhr + ((number % 5) * glyphwidth);
    glyph.topmargin = marginvr + ((number / 5) * glyphheight);
    [glyph rasterize];
    
    return glyph;
}

-(instancetype)init
{
    self = [super init];
    self.width = glyphwidth;
    self.height = glyphheight;
    self.atlaswidth = atlaswidth;
    self.atlasheight = atlasheight;
    self.assetname = assetname;
    
    return self;
}

@end