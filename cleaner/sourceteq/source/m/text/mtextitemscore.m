#import "mtextitemscore.h"

static CGFloat const sizescore = 0.3;
static NSInteger const ttlscore = 100;

@implementation mtextitemscore

-(instancetype)init:(mtext*)model
{
    self = [super init:model ttl:ttlscore];
    
    return self;
}

@end