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

#pragma mark actions

-(void)actionexit:(UIButton*)button
{
    [self.controller exitgame];
}

#pragma mark functionality

@end