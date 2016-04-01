#import "mareadust.h"

@implementation mareadust

-(instancetype)init:(marea*)modelarea
{
    self = [super init];
    self.modelarea = modelarea;
    self.items = [NSMutableArray array];
    
    return self;
}

#pragma mark public

-(void)add
{
    CGFloat y = 100;
    CGFloat x = arc4random_uniform(self.modelarea.screenwidth);
    gareadust *dust = [[gareadust alloc] init:<#(marea *)#>];
}

@end