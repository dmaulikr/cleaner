#import "mgamehublife.h"

static NSInteger const initialamount = 100;

@implementation mgamehublife

-(instancetype)init:(mgame*)model
{
    self = [super init];
    self.model = model;
    self.amount = initialamount;
    self.changed = NO;
    
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

@end