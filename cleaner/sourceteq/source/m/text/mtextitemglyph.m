#import "mtextitemglyph.h"
#import "appdel.h"

@implementation mtextitemglyph

#pragma mark public

-(void)rasterize
{
    self.spatial = [[gtext alloc] init:self];
}

@end