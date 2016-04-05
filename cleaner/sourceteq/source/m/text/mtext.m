#import "mtext.h"

static NSInteger const ttlscore = 200;

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
    text = @"0123456789";
    mtextitem *item = [mtextitem numbers:self text:text x:x y:y ttl:ttlscore];
    [self.items addObject:item];
}

@end