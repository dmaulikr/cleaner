#import "mgun.h"

@implementation mgun

-(instancetype)init:(marea*)modelarea
{
    self = [super init];
    self.modelarea = modelarea;
    self.spatialpointer = [[ggunpointer alloc] init];
    self.spatialtarget = [[gguntarget alloc] init];
    self.spatialpointer.x = 100;
    self.spatialpointer.y = 100;
    self.spatialtarget.x = 100;
    self.spatialtarget.y = 100;
    self.spatialpointer.width = 50;
    self.spatialpointer.height = 50;
    self.spatialtarget.width = 50;
    self.spatialtarget.height = 50;
    [self.spatialtarget rasterize];
    [self.spatialpointer rasterize];
    
    return self;
}

@end