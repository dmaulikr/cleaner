#import "mtextitemscore.h"

static CGFloat const sizescore = 0.3;
static CGFloat const paddingscore = 6;
static NSInteger const ttlscore = 70;
static NSUInteger const speedscore = 1;

@implementation mtextitemscore
{
    NSUInteger current;
}

-(instancetype)init:(mtext*)model text:(NSString*)text x:(NSInteger)x y:(NSInteger)y
{
    self = [super init:model text:text x:x y:y];
    current = 0;
    self.glyphclass = [mtextitemglyphnumber class];
    CGFloat padding = - sizescore * paddingscore;
    [self render:text x:x y:y size:sizescore padding:padding];
    [self starttimer:ttlscore];
    
    return self;
}

#pragma mark -
#pragma mark text item

-(void)move
{
    [super move];
    
    current++;
    
    if(current > speedscore)
    {
        current = 0;
        
        for(mtextitemglyph *glyph in self.glyphs)
        {
            [glyph.spatial updateprojection:0 dy:-1];
        }
    }
}

@end