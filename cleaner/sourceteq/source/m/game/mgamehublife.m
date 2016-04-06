#import "mgamehublife.h"

static NSInteger const initialamount = 100;
static NSInteger const lifex = 20;
static NSInteger const lifey = 20;
static NSInteger const lifewidth = 200;
static NSInteger const lifeheight = 20;
static NSInteger const lifemarginhr = 2;
static NSInteger const lifemarginvr = 2;

@implementation mgamehublife
{
    NSInteger maxlifewidth;
    NSInteger maxlifeheight;
}

-(instancetype)init:(mgame*)model
{
    self = [super init];
    self.model = model;
    self.amount = initialamount;
    self.changed = NO;
    maxlifeheight = lifeheight - (lifemarginvr + lifemarginvr);
    maxlifewidth = lifewidth - (lifemarginhr + lifemarginhr);
    
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
    
}

@end