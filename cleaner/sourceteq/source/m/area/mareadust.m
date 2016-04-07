#import "mareadust.h"

@implementation mareadust

-(instancetype)init
{
    self = [super init];
    self.items = [NSMutableArray array];
    
    return self;
}

#pragma mark public

-(void)add
{
    NSInteger y = screenheight;
    NSInteger x = arc4random_uniform((CGFloat)screenwidth);
    mareadustitem *dust = [[mareadustitem alloc] init:self x:x y:y];
    [self.items addObject:dust];
}

@end