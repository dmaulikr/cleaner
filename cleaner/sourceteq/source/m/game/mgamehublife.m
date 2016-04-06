#import "mgamehublife.h"

static NSInteger const maxlife = 100;
static NSInteger const lifex = 20;
static NSInteger const lifey = 20;
static NSInteger const lifewidth = 200;
static NSInteger const lifeheight = 20;
static NSInteger const lifemarginleft = 20;
static NSInteger const lifemarginright = 10;
static NSInteger const lifemarginvr = 3;

@implementation mgamehublife
{
    NSInteger maxlifewidth;
    NSInteger maxlifeheight;
}

-(instancetype)init:(mgame*)model
{
    self = [super init];
    self.model = model;
    self.amount = maxlife;
    self.changed = YES;
    maxlifeheight = lifeheight - (lifemarginvr + lifemarginvr);
    maxlifewidth = lifewidth - (lifemarginleft + lifemarginright);
    
    self.spatiallife = [[ghublife alloc] init];
    self.spatiallife.x = lifex;
    self.spatiallife.y = lifey;
    self.spatiallife.width = lifewidth;
    self.spatiallife.height = lifeheight;
    [self.spatiallife rasterize];
    
    self.spatiallifebar = [[ghublifebar alloc] init];
    self.spatiallifebar.x = lifex + lifemarginleft;
    self.spatiallifebar.y = lifey + lifemarginvr;
    self.spatiallifebar.height = maxlifeheight;
    [self reposlife];
    
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
    if(self.changed)
    {
        self.changed = NO;
        [self.spatiallifebar render];
    }
}

#pragma mark functionality

-(void)reposlife
{
    CGFloat percent = self.amount / (CGFloat)maxlife;
    NSInteger lifewidth = percent * maxlifewidth;
    self.spatiallifebar.width = lifewidth;
}

@end