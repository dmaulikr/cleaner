#import "vgame.h"

GLKBaseEffect *effect;

@implementation vgame

-(instancetype)init:(cgame*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor blackColor]];
    [self setContext:controller.model.context];
    [EAGLContext setCurrentContext:controller.model.context];
    [self setDelegate:self];
    self.controller = controller;
    [self starteffect];
    
    vgamehub *hub = [[vgamehub alloc] init:controller];
    self.hub = hub;
    
    [self addSubview:hub];

    NSDictionary *views = @{@"hub":hub};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[hub]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[hub]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark functionality

-(void)starteffect
{
    effect = [[GLKBaseEffect alloc] init];
    effect.transform.projectionMatrix = projectionbase;
    effect.texture2d0.target = GLKTextureTarget2D;
}

#pragma mark public

-(void)pause
{
    if(!self.viewpause)
    {
        vgamepause *viewpause = [[vgamepause alloc] init:self.controller];
        self.viewpause = viewpause;
        [self addSubview:viewpause];
        
        NSDictionary *views = @{@"viewpause":viewpause};
        NSDictionary *metrics = @{};
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[viewpause]-0-|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[viewpause]-0-|" options:0 metrics:metrics views:views]];
    }
}

#pragma mark -
#pragma mark glkview del

-(void)glkView:(GLKView*)view drawInRect:(CGRect)rect
{
    glDisable(GL_DEPTH_TEST);
    glClearColor(0,0,0,0);
    glClear(GL_COLOR_BUFFER_BIT);
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notification_glkdraw object:nil];
    
    glDisableVertexAttribArray(GLKVertexAttribPosition);
    glDisable(GL_BLEND);
}

@end