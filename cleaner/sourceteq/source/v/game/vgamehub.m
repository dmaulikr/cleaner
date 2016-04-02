#import "vgamehub.h"

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
    if(touches.count == 2)
    {
        [self movegun:touches];
    }
}

-(void)touchesMoved:(NSSet<UITouch*>*)touches withEvent:(UIEvent*)event
{
    if(touches.count == 2)
    {
        [self movegun:touches];
    }
}

#pragma mark actions

-(void)actionexit:(UIButton*)button
{
    [self.controller exitgame];
}

#pragma mark functionality

-(void)movegun:(NSSet<UITouch*>*)touches
{
    UITouch *touch = touches.anyObject;
    
    if(touch)
    {
        CGPoint location = [touch locationInView:self];
        NSInteger x = roundf(location.x);
        NSInteger y = roundf(location.y);
        
        [self.controller.model.modelgun movetox:x y:y];
    }
}

@end