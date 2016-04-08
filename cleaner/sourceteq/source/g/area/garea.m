#import "garea.h"

@implementation garea

-(instancetype)init:(mcolor*)lefttop leftbottom:(mcolor*)leftbottom righttop:(mcolor*)righttop rightbottom:(mcolor*)rightbottom
{
    self = [super init:lefttop leftbottom:leftbottom righttop:righttop rightbottom:rightbottom];
    self.x = 0;
    self.y = 0;
    self.width = screenwidth;
    self.height = screenheight;
    
    [self render];
    
    return self;
}

@end