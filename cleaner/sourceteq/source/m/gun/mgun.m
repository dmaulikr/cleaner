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
    if(self.closedloop)
    {
        CGFloat xa = self.loopstart.x;
        CGFloat ya = self.loopstart.y;
        CGFloat xb = self.loopend.x;
        CGFloat yb = self.loopend.y;
        CGFloat deltax = xa - xb;
        CGFloat deltay = ya - yb;
        NSInteger x = roundf(xa - deltax);
        NSInteger y = roundf(yb - deltay);
        
        [self.spatialpointer centerx:x y:y];
        [self.spatialtarget centerx:x y:y];
    }
}

#pragma mark public

-(void)startloopat:(CGPoint)point
{
    self.loopstart = point;
}

-(void)closeloopat:(CGPoint)point
{
    self.loopend = point;
    self.closedloop = YES;
}

@end