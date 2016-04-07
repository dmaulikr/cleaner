#import "sbuilding.h"

static NSInteger const interitem = 150;

typedef NS_ENUM(NSUInteger, building_kind)
{
    building_kind_alpha,
    building_kind_beta,
    building_kind_empty,
    building_kind_none
};

@implementation sbuilding

-(instancetype)init:(mbuilding*)model
{
    self = [super init];
    self.model = model;
    NSInteger sumx = - interitem;
    
    while(sumx < screenwidth)
    {
        building_kind kind = arc4random_uniform(building_kind_none);
        
        switch(kind)
        {
            case building_kind_alpha:
                
                sumx += [self addalpha:sumx];
                
                break;
                
            case building_kind_beta:
                
                sumx += [self addbeta:sumx];
                
                break;
                
            case building_kind_empty:
            case building_kind_none:
                break;
        }
        
        sumx += interitem;
    }
    
    return self;
}

#pragma mark functionality

-(NSInteger)addalpha:(NSInteger)sumx
{
    mbuildingitemalpha *item = [[mbuildingitemalpha alloc] init:sumx];
    [self.model.items addObject:item];
    
    return item.spatial.width;
}

-(NSInteger)addbeta:(NSInteger)sumx
{
    mbuildingitembeta *item = [[mbuildingitembeta alloc] init:sumx];
    [self.model.items addObject:item];
    
    return item.spatial.width;
}

@end