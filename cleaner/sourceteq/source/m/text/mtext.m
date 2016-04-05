#import "mtext.h"

static CGFloat const sizescore = 0.4;
static NSInteger const ttlscore = 100;

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
    mtextitem *item = [mtextitem numbers:self text:text x:x y:y ttl:ttlscore size:sizescore];
    [self.items addObject:item];
}

@end