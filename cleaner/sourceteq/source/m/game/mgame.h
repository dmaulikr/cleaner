#import "appdel.h"

extern GLKVector2 *pointertexture;
extern GLKBaseEffect *effect;
extern GLKMatrix4 projectionbase;
extern NSInteger screenwidth;
extern NSInteger screenheight;

@class cgameloader;
@class marea;
@class mfoe;
@class mbuilding;
@class mgun;
@class meffect;
@class mtext;
@class mgamehub;
@class mtextures;

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
@property(strong, nonatomic)mtextures *modeltextures;

@end