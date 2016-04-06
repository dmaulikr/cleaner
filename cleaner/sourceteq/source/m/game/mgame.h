#import "appdel.h"

@class cgameloader;
@class marea;
@class mfoe;
@class mbuilding;
@class mgun;
@class meffect;
@class mtext;
@class mgamehub;

@interface mgame:NSObject

-(instancetype)init:(cgameloader*)controller;

@property(strong, nonatomic)EAGLContext *context;
@property(strong, nonatomic)marea *modelarea;
@property(strong, nonatomic)mfoe *modelfoe;
@property(strong, nonatomic)mbuilding *modelbuilding;
@property(strong, nonatomic)mgun *modelgun;
@property(strong, nonatomic)meffect *modeleffect;
@property(strong, nonatomic)mtext *modeltext;
@property(strong, nonatomic)mgamehub *modelhub;

@end