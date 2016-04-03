#import "vgamehub.h"

@interface vgamehub ()

@property(weak, nonatomic)mgun *modelgun;

@end

@implementation vgamehub
{
    CGFloat originx;
    CGFloat originy;
}

-(instancetype)init:(cgame*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setMultipleTouchEnabled:YES];
    self.controller = controller;
    self.modelgun = controller.model.modelgun;
    self.modelgun.hub = self;
    
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundColor:[UIColor main]];
    [button setAlpha:0.3];
    [button setClipsToBounds:YES];
    [button.layer setCornerRadius:25];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button addTarget:self action:@selector(actionexit:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:button];
    
    NSDictionary *views = @{@"button":button};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[button(50)]-20-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[button(50)]" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark gestures

-(void)touchesBegan:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    [self movegun:touches];
}

-(void)touchesMoved:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    [self movegun:touches];
}

-(void)touchesEnded:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    [self.modelgun clearloop];
}

-(void)touchesCancelled:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    [self.modelgun clearloop];
}

#pragma mark actions

-(void)actionexit:(UIButton*)button
{
    [self.controller exitgame];
}

#pragma mark functionality

-(void)movegun:(NSSet<UITouch*>*)touches
{
    NSArray<UITouch*> *tarray = touches.allObjects;
    NSUInteger count = tarray.count;
    
    if(count)
    {
        UITouch *toucha = tarray[0];
        self.modelgun.touchstart = toucha;
        
        if(count > 1)
        {
            UITouch *touchb = tarray[1];
            self.modelgun.touchend = touchb;
        }
    }
}

@end