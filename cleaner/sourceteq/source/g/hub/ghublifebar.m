#import "ghublifebar.h"

static CGFloat const red = 0.01568;
static CGFloat const green = 0.76862;
static CGFloat const blue = 0.85098;
static CGFloat const alpha = 0.5;

@implementation ghublifebar

-(instancetype)init
{
    self = [super init:[mcolor red:red green:green blue:blue alpha:alpha]];
    
    return self;
}

@end