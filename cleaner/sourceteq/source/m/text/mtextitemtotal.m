#import "mtextitemtotal.h"

static CGFloat const paddingtotal = 3;
static CGFloat const sizetotal = 0.45;

@implementation mtextitemtotal

-(instancetype)init:(mtext*)model text:(NSString*)text x:(NSInteger)x y:(NSInteger)y
{
    self = [super init:model text:text x:x y:y];
    self.glyphclass = [mtextitemglyphnumber class];
    CGFloat padding = - sizetotal * paddingtotal;
    [self render:text x:x y:y size:sizetotal padding:padding];
    
    return self;
}

@end