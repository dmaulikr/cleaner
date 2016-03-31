#import "gareaspatial.h"

@implementation gareaspatial

-(instancetype)init:(marea*)model
{
    self = [super init];
    self.model = model;
    self.x = 0;
    self.y = 0;
    self.width = model.screenwidth;
    self.height = model.screenheight;
    [super render];
    
    return self;
}

#pragma mark -
#pragma mark spatial

-(void)render
{
}

@end