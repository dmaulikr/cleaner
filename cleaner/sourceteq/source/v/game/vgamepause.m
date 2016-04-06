#import "vgamepause.h"

@implementation vgamepause

-(instancetype)init:(cgame*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.controller = controller;
    
    UIButton *buttonresume = [[UIButton alloc] init];
    [buttonresume setClipsToBounds:YES];
    [buttonresume setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIButton *buttonexit = [[UIButton alloc] init];
    [buttonexit setClipsToBounds:YES];
    [buttonexit setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self addSubview:buttonresume];
    [self addSubview:buttonexit];
    
    return self;
}

@end