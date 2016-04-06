#import "mgame.h"

@implementation mgame

-(instancetype)init:(cgameloader*)controller;
{
    self = [super init];
    [self loadall:controller];
    
    return self;
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
                                          weakself.modeleffect = [[meffect alloc] init];
                                          weakself.modeltext = [[mtext alloc] init];
                                          weakself.modelbuilding = [[mbuilding alloc] init:weakself.modelarea];
                                          weakself.modelfoe = [[mfoe alloc] init:weakself.modelarea effect:weakself.modeleffect text:weakself.modeltext];
                                          weakself.modelgun = [[mgun alloc] init:weakself.modelarea];
                                          weakself.modelhub = [[mgamehub alloc] init];
                                          
                                          dispatch_async(dispatch_get_main_queue(),
                                                         ^
                                                         {
                                                             [controller loadingfinished];
                                                         });
                                      });
                   });
}

@end