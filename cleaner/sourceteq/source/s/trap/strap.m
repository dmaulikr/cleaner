#import "strap.h"

typedef NS_ENUM(NSUInteger, trap_kind)
{
    trap_kind_bomb,
    trap_kind_none
};

static NSInteger const minx = 50;
static NSInteger const minusmaxx = 100;

@implementation strap
{
    __weak mtrap *model;
    CGFloat maxx;
}

-(instancetype)init:(mtrap*)newmodel
{
    self = [super init];
    model = newmodel;
    maxx = screenwidth - minusmaxx;
    
    return self;
}

#pragma mark public

-(mtrapitem*)trap
{
    mtrapitem *trap;
    NSInteger x = arc4random_uniform(maxx) + minx;
    trap_kind kind = arc4random_uniform(trap_kind_none);
    Class class;
    
    switch(kind)
    {
        case trap_kind_bomb:
            
            class = [mtrapitembomb class];
            
            break;
            
        case trap_kind_none:
            break;
    }
    
    trap = [[class alloc] init:model x:x];
    
    return trap;
}

@end