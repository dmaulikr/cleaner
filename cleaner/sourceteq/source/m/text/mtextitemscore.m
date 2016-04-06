#import "mtextitemscore.h"

static CGFloat const padding = 6;
static CGFloat const sizescore = 0.3;
static NSInteger const ttlscore = 100;

@implementation mtextitemscore

-(instancetype)init:(mtext*)model text:(NSString*)text x:(NSInteger)x y:(NSInteger)y
{
    self = [super init:model text:text x:x y:y];
    self.ttl = ttlscore;
    self.size = sizescore;
    self.padding = - sizescore * padding;
    
    [self render];
    
    return self;
}

@end