#import "sfoe.h"

typedef NS_ENUM(NSUInteger, foe_kind)
{
    foe_kind_invader,
    foe_kind_octo,
    foe_kind_none
};

static NSInteger const minx = 50;
static NSInteger const minusmaxx = 100;

@implementation sfoe
{
    CGFloat maxx;
}

-(instancetype)init:(mfoe*)model
{
    self = [super init];
    self.model = model;
    maxx = screenwidth - minusmaxx;
    
    return self;
}

#pragma mark public

-(mfoeitem*)foe
{
    mfoeitem *foe;
    NSInteger x = arc4random_uniform(maxx) + minx;
    foe_kind kind = arc4random_uniform(foe_kind_none);
    Class class;
    
    switch(kind)
    {
        case foe_kind_invader:
            
            class = [mfoeiteminvader class];
            
            break;
            
        case foe_kind_octo:
            
            class = [mfoeitemocto class];
            
            break;
            
        case foe_kind_none:
            break;
    }
    
    foe = [[class alloc] init:self.model x:x];
    
    return foe;
}

@end