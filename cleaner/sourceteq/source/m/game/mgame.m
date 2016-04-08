#import "mgame.h"

GLKVector2 *pointertexture;
GLKMatrix4 rotationclear;

@interface mgame ()

@property(strong, nonatomic)NSMutableData *datatexture;

@end

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
                       
                       [[mtextures singleton] loadtextures];
                       
                       dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                                      ^
                                      {
                                          weakself.datatexture = [NSMutableData dataWithLength:vectorcorners * sizeof(GLKVector2)];
                                          pointertexture = weakself.datatexture.mutableBytes;
                                          pointertexture[0] = GLKVector2Make(0, 0);
                                          pointertexture[1] = GLKVector2Make(0, 1);
                                          pointertexture[2] = GLKVector2Make(1, 1);
                                          pointertexture[3] = GLKVector2Make(1, 1);
                                          pointertexture[4] = GLKVector2Make(1, 0);
                                          pointertexture[5] = GLKVector2Make(0, 0);
                                          
                                          rotationclear = GLKMatrix4MakeRotation(0, 0, 0, 1);
                                          
                                          weakself.modelarea = [[marea alloc] init];
                                          weakself.modeleffect = [[meffect alloc] init];
                                          weakself.modeltext = [[mtext alloc] init];
                                          weakself.modelbuilding = [[mbuilding alloc] init];
                                          weakself.modelhub = [[mgamehub alloc] init:weakself.modeltext];
                                          weakself.modelfoe = [[mfoe alloc] init:weakself.modeleffect text:weakself.modeltext scorer:weakself.modelhub.score];
                                          weakself.modelgun = [[mgun alloc] init];
                                          
                                          dispatch_async(dispatch_get_main_queue(),
                                                         ^
                                                         {
                                                             [controller loadingfinished];
                                                         });
                                      });
                   });
}

@end