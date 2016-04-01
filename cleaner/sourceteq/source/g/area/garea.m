#import "garea.h"

@implementation garea

-(instancetype)init:(marea*)model
{
    self = [super init];
    self.model = model;
    self.x = 0;
    self.y = 0;
    self.width = model.screenwidth;
    self.height = model.screenheight;
    
    return self;
}

@end