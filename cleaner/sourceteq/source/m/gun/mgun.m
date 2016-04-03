#import "mgun.h"

@implementation mgun

-(instancetype)init:(marea*)modelarea
{
    self = [super init];
    self.modelarea = modelarea;
    self.spatialpointer = [[ggunpointer alloc] init];
    self.spatialtarget = [[gguntarget alloc] init];
    [self.spatialtarget rasterize];
    [self.spatialpointer rasterize];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedglkmove:(NSNotification*)notification
{
    if(self.touchstart && self.touchend)
    {
        CGPoint pointstart = [self.touchstart locationInView:self.hub];
        CGPoint pointend = [self.touchend locationInView:self.hub];
        CGFloat xa = pointstart.x;
        CGFloat ya = pointstart.y;
        CGFloat xb = pointend.x;
        CGFloat yb = pointend.y;
        CGFloat deltax = xa - xb;
        CGFloat deltay = ya - yb;
        CGFloat deltax_2 = deltax / 2.0;
        CGFloat deltay_2 = deltay / 2.0;
        NSInteger x = roundf(xa - deltax_2);
        NSInteger y = roundf(ya - deltay_2);
        
        [self.spatialpointer centerx:x y:y];
        [self.spatialtarget centerx:x y:y];
    }
}

#pragma mark public

-(void)clearloop
{
    self.spatialtarget.active = NO;
    self.spatialpointer.active = NO;
}

@end