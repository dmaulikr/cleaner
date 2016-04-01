#import "mgun.h"

@implementation mgun

-(instancetype)init:(marea*)modelarea
{
    self = [super init];
    self.modelarea = modelarea;
    self.spatialpointer = [[ggunpointer alloc] init];
    self.spatialtarget = [[gguntarget alloc] init];
    
    return self;
}

@end