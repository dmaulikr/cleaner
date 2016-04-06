#import "mtextitemtotal.h"

static CGFloat const padding = 3;
static CGFloat const sizescore = 0.45;

@implementation mtextitemtotal

-(instancetype)init:(mtext*)model text:(NSString*)text x:(NSInteger)x y:(NSInteger)y
{
    self = [super init:model text:text x:x y:y];
    self.size = sizescore;
    self.padding = - sizescore * padding;
    [self render];
    
    return self;
}

#pragma mark -
#pragma mark text item

-(mtextitemglyph*)glyphwith:(NSString*)character at:(NSInteger)x
{
    mtextitemglyphnumber *glyph = [[mtextitemglyphnumber alloc] init:character x:x y:self.y size:self.size];
    
    return glyph;
}

@end