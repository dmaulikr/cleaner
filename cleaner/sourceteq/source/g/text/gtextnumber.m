#import "gtextnumber.h"

static NSInteger const glyphwidth = 24;
static NSInteger const glyphheight = 34;
static NSInteger const marginhr = 6;
static NSInteger const marginvr = 7;

@implementation gtextnumber

-(instancetype)init
{
    self = [super init];
    self.width = glyphwidth;
    self.height = glyphheight;
    
    return self;
}

@end