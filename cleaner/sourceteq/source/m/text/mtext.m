#import "mtext.h"

@implementation mtext

-(instancetype)init
{
    self = [super init];
    self.items = [NSMutableArray array];
    
    return self;
}

#pragma mark public

-(void)addscoretext:(NSString*)text x:(NSInteger)x y:(NSInteger)y
{
    mtextitem *item = [[mtextitem alloc] init];
}

@end