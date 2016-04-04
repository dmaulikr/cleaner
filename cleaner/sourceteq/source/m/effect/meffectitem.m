#import "meffectitem.h"
#import "appdel.h"

@implementation meffectitem

-(instancetype)init:(meffect*)model x:(CGFloat)x y:(CGFloat)y
{
    self = [super init];
    self.model = model;
    self.spatial = [[geffect alloc] init:self];
    self.spatial.realx = x;
    self.spatial.realy = y;
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedglkmove:(NSNotification*)notification
{
    self.ttl--;
    
    if(self.ttl < 1)
    {
        [self.model.items removeObject:self];
    }
}

#pragma mark public

-(void)rasterize
{
    [self.spatial rasterize];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
}

@end