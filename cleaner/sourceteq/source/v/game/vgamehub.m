#import "vgamehub.h"

static NSUInteger const pausesize = 40;

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
    [button setClipsToBounds:YES];
    [button setImage:[[UIImage imageNamed:@"pause"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [button setImage:[[UIImage imageNamed:@"pause"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateHighlighted];
    [button.imageView setContentMode:UIViewContentModeCenter];
    [button.imageView setClipsToBounds:YES];
    [button.imageView setTintColor:[UIColor colorWithWhite:1 alpha:0.3]];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button addTarget:self action:@selector(actionpause:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:button];
    
    NSDictionary *views = @{@"button":button};
    NSDictionary *metrics = @{@"pausesize":@(pausesize)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[button(pausesize)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[button(pausesize)]" options:0 metrics:metrics views:views]];
    
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

-(void)actionpause:(UIButton*)button
{
    [self.controller setPaused:YES];
}

#pragma mark functionality

-(void)movegun:(NSSet<UITouch*>*)touches
{
    NSArray<UITouch*> *tarray = touches.allObjects;
    NSUInteger count = tarray.count;
    
    if(count)
    {
        UITouch *toucha = tarray[0];
        
        if(self.modelgun.touchstart)
        {
            if(self.modelgun.touchstart != toucha)
            {
                self.modelgun.touchend = toucha;
            }
        }
        else
        {
            if(self.modelgun.touchend != toucha)
            {
                self.modelgun.touchstart = toucha;
            }
        }
        
        if(count > 1)
        {
            UITouch *touchb = tarray[1];
            
            if(!self.modelgun.touchend)
            {
                if(self.modelgun.touchstart != touchb)
                {
                    self.modelgun.touchend = touchb;
                }
                else
                {
                    self.modelgun.touchend = toucha;
                }
            }
        }
    }
}

@end