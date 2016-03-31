#import "gfoe.h"

@implementation gfoe

-(instancetype)init:(mfoe*)model
{
    self = [super init];
    self.model = model;
    
    return self;
}

#pragma mark -
#pragma mark gbase

-(void)draw:(GLKBaseEffect*)effect
{
    
    
    for(mfoeitem *item in self.model.items)
    {
        [item.spatial draw:effect];
    }
}

@end