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
    CGFloat y = self.modelarea.screenheight;
    CGFloat x = arc4random_uniform(self.modelarea.screenwidth);
    mareadustitem *dust = [[mareadustitem alloc] init:self x:x y:y];
    [self.items addObject:dust];
}

@end