#import "mfoe.h"

@implementation mfoe

-(instancetype)init:(marea*)modelarea
{
    self = [super init];
    self.modelarea = modelarea;
    self.items = [NSMutableArray array];
    self.rawfoes = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"foes" withExtension:@"plist"]];
    
    return self;
}

#pragma mark public

-(void)addfoe
{
    NSUInteger index = arc4random_uniform((CGFloat)self.rawfoes.count);
    NSDictionary *rawfoe = self.rawfoes[index];
}

@end