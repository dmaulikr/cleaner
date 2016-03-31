#import "marea.h"

@implementation marea

-(instancetype)init
{
    self = [super init];
    
    CGFloat rawscreenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat rawscreenheight = [UIScreen mainScreen].bounds.size.height;
    
    if(rawscreenwidth > rawscreenheight)
    {
        self.screenwidth = rawscreenwidth;
        self.screenheight = rawscreenheight;
    }
    else
    {
        self.screenwidth = rawscreenheight;
        self.screenheight = rawscreenwidth;
    }
    
    return self;
}

@end