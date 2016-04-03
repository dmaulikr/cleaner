#import "ggun.h"

static CGFloat const gunsize = 40;

@implementation ggun
{
    CGFloat gunsize_2;
}

-(instancetype)init
{
    self = [super init];
    gunsize_2 = gunsize / 2.0;
    
    return self;
}

#pragma mark public

-(void)centerx:(NSInteger)x y:(NSInteger)y
{
    self.width = gunsize;
    self.height = gunsize;
    self.x = x - gunsize_2;
    self.y = y - gunsize_2;
    
    [self render];
}

@end