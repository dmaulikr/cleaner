#import "ghublifebar.h"

static CGFloat const red = 1;
static CGFloat const green = 1;
static CGFloat const blue = 1;
static CGFloat const alpha = 0.4;

@implementation ghublifebar

-(instancetype)init
{
    self = [super init:[mcolor red:red green:green blue:blue alpha:alpha]];
    [self rasterize];
    
    return self;
}

@end