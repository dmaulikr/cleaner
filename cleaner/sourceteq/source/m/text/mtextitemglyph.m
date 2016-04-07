#import "mtextitemglyph.h"
#import "appdel.h"

@implementation mtextitemglyph

-(instancetype)init:(mtextures*)modeltextures character:(NSString*)character x:(NSInteger)x y:(NSInteger)y size:(CGFloat)size
{
    self = [super init];
    self.modeltextures = modeltextures;
    self.x = x;
    self.y = y;
    
    return self;
}

#pragma mark public

-(void)rasterize
{
    self.spatial = [[gtext alloc] init:self];
}

@end