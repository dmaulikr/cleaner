#import "meffectitem.h"
#import "appdel.h"

@implementation meffectitem

-(instancetype)init:(meffect*)model x:(CGFloat)x y:(CGFloat)y
{
    self = [super init];
    self.model = model;
    self.spatial = [[geffect alloc] init:self];
    self.spatial.x = x;
    self.spatial.y = y;
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedglkmove:(NSNotification*)notification
{
    
}

#pragma mark public

-(void)rasterize
{
    [self.spatial rasterize];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
}

@end