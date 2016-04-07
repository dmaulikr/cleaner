#import "meffectitem.h"
#import "appdel.h"

@implementation meffectitem
{
    NSInteger ttl;
}

-(instancetype)init:(meffect*)model x:(NSInteger)x y:(NSInteger)y
{
    self = [super init];
    self.model = model;
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedglkmove:(NSNotification*)notification
{
    ttl--;
    
    if(ttl < 1)
    {
        [self.model.items removeObject:self];
    }
}

#pragma mark public

-(void)starttimer:(NSInteger)newttl
{
    ttl = newttl;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
}

@end