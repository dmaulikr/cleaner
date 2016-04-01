#import "mgame.h"

static NSUInteger const speedaddfoe = 100;

@implementation mgame
{
    NSUInteger counteraddfoe;
}

-(instancetype)init:(cgameloader*)controller;
{
    self = [super init];
    [self loadall:controller];
    
    counteraddfoe = 0;
    
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
    counteraddfoe++;
    
    if(counteraddfoe >= speedaddfoe)
    {
        counteraddfoe = 0;
        [self.modelfoe addfoe];
    }
}

#pragma mark functionality

-(void)loadall:(cgameloader*)controller
{
    __weak typeof(self) weakself = self;
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       weakself.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
                       [EAGLContext setCurrentContext:weakself.context];
                       
                       dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                                      ^
                                      {
                                          weakself.modelarea = [[marea alloc] init];
                                          weakself.modelbuilding = [[mbuilding alloc] init:weakself.modelarea];
                                          weakself.modelfoe = [[mfoe alloc] init];
                                          [weakself.modelarea rasterize];
                                          
                                          dispatch_async(dispatch_get_main_queue(),
                                                         ^
                                                         {
                                                             [controller loadingfinished];
                                                         });
                                      });
                   });
}

@end