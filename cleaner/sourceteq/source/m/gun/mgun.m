#import "mgun.h"

typedef NS_ENUM(NSUInteger, delta_move)
{
    delta_move_add,
    delta_move_subs,
    delta_move_none
};

static NSInteger const deltaspeed = 10;

@interface mgun ()

@property(nonatomic)delta_move deltahr;
@property(nonatomic)delta_move deltavr;
@property(nonatomic)NSInteger expectedx;
@property(nonatomic)NSInteger expectedy;

@end

@implementation mgun

-(instancetype)init:(marea*)modelarea
{
    self = [super init];
    self.modelarea = modelarea;
    self.spatialpointer = [[ggunpointer alloc] init];
    self.spatialtarget = [[gguntarget alloc] init];
    self.deltahr = delta_move_none;
    self.deltavr = delta_move_none;
    self.expectedx = modelarea.centerx;
    self.expectedy = modelarea.centery;
    [self innermovetox:self.expectedx y:self.expectedy];
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
    NSInteger newx = self.x;
    NSInteger newy = self.y;
    
    if(self.deltahr != delta_move_none)
    {
        edited = YES;
        
        if(self.deltahr == delta_move_add)
        {
            newx = self.x += deltaspeed;
            
            if(newx > self.expectedx)
            {
                newx = self.expectedx;
                self.deltahr = delta_move_none;
            }
        }
        else
        {
            newx = self.x -= deltaspeed;
            
            if(newx < self.expectedx)
            {
                newx = self.expectedx;
                self.deltahr = delta_move_none;
            }
        }
    }
    
    if(self.deltavr != delta_move_none)
    {
        edited = YES;
        
        if(self.deltavr == delta_move_add)
        {
            newy = self.y += deltaspeed;
            
            if(newy > self.expectedy)
            {
                newy = self.expectedy;
                self.deltavr = delta_move_none;
            }
        }
        else
        {
            newy = self.y -= deltaspeed;
            
            if(newy < self.expectedy)
            {
                newy = self.expectedy;
                self.deltavr = delta_move_none;
            }
        }
    }
    
    if(edited)
    {
        [self innermovetox:newx y:newy];
    }
    
    [self.spatialpointer movetotop];
    [self.spatialtarget movetotop];
}

#pragma mark functionality

-(void)innermovetox:(NSInteger)x y:(NSInteger)y
{
    BOOL focused = NO;
    
    if(self.deltavr == delta_move_none && self.deltahr == delta_move_none)
    {
        focused = YES;
    }
    
    self.x = x;
    self.y = y;
    [self.spatialpointer centeronx:x y:y focused:focused];
    [self.spatialtarget centeronx:x y:y focused:focused];
}

#pragma mark public

-(void)movetox:(NSInteger)x y:(NSInteger)y
{
    NSInteger deltax = self.x - x;
    NSInteger deltay = self.y - y;
    self.expectedx = x;
    self.expectedy = y;
    
    if(deltax < 0)
    {
        self.deltahr = delta_move_add;
    }
    else if(deltax > 0)
    {
        self.deltahr = delta_move_subs;
    }
    else
    {
        self.deltahr = delta_move_none;
    }
    
    if(deltay < 0)
    {
        self.deltavr = delta_move_add;
    }
    else if(deltay > 0)
    {
        self.deltavr = delta_move_subs;
    }
    else
    {
        self.deltavr = delta_move_none;
    }
}

@end