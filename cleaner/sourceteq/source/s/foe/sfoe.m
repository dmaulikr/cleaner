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
    
    switch(kind)
    {
        case foe_kind_invader:
            
            break;
            
        case foe_kind_octo:
            
            break;
            
        case foe_kind_none:
            break;
    }
    
    return foe;
}

@end