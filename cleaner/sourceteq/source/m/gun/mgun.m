#import "mgun.h"

typedef NS_ENUM(NSUInteger, delta_move)
{
    delta_move_add,
    delta_move_subs,
    delta_move_none
};

@interface mgun ()

@property(nonatomic)NSUInteger expectedx;
@property(nonatomic)NSUInteger expectedy;
@property(nonatomic)delta_move deltahr;
@property(nonatomic)delta_move deltavr;

@end

@implementation mgun

-(instancetype)init:(marea*)modelarea
{
    self = [super init];
    self.modelarea = modelarea;
    self.spatialpointer = [[ggunpointer alloc] init];
    self.spatialtarget = [[gguntarget alloc] init];
    [self innermovetox:modelarea.centerx y:modelarea.centery];
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
    BOOL edited = NO;
    
    if(self.deltahr != delta_move_none)
    {
        edited = YES;
    }
    
    if(self.deltavr != delta_move_none)
    {
        edited = YES;
    }
    
    if(edited)
    {
        [self.spatialpointer render];
        [self.spatialtarget render];
    }
    
    [self.spatialpointer movetotop];
    [self.spatialtarget movetotop];
}

#pragma mark functionality

-(void)innermovetox:(NSInteger)x y:(NSInteger)y
{
    self.x = x;
    self.y = y;
}

#pragma mark public

-(void)movetox:(NSInteger)x y:(NSInteger)y
{
    NSInteger deltax = self.x - x;
    NSInteger deltay = self.y - y;
    
    
}

@end