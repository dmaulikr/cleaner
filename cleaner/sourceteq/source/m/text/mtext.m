#import "mtext.h"

@implementation mtext

-(instancetype)init
{
    self = [super init];
    self.items = [NSMutableArray array];
    
    return self;
}

#pragma mark notified

#pragma mark public

-(void)addscoretext:(NSString*)text x:(NSInteger)x y:(NSInteger)y
{
    mtextitemscore *model = [[mtextitemscore alloc] init:self text:text x:x y:y];
    [self.items addObject:model];
}

-(mtextitem*)addtotalscore:(NSString*)text x:(NSInteger)x y:(NSInteger)y
{
    mtextitemtotal *model = [[mtextitemtotal alloc] init:self text:text x:x y:y];
    [self.items addObject:model];
    
    return model;
}

@end