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
                                          weakself.modeltextures = [[mtextures alloc] init];
                                          weakself.modelarea = [[marea alloc] init:weakself.modeltextures];
                                          weakself.modeleffect = [[meffect alloc] init:weakself.modeltextures];
                                          weakself.modeltext = [[mtext alloc] init:weakself.modeltextures];
                                          weakself.modelbuilding = [[mbuilding alloc] init:weakself.modeltextures area:weakself.modelarea];
                                          weakself.modelhub = [[mgamehub alloc] init:weakself];
                                          weakself.modelfoe = [[mfoe alloc] init:weakself area:weakself.modelarea effect:weakself.modeleffect text:weakself.modeltext];
                                          weakself.modelgun = [[mgun alloc] init:weakself.modeltextures area:weakself.modelarea];
                                          
                                          dispatch_async(dispatch_get_main_queue(),
                                                         ^
                                                         {
                                                             [controller loadingfinished];
                                                         });
                                      });
                   });
}

@end