#import "vgamepause.h"

static NSUInteger const buttonwidth = 140;
static NSUInteger const buttonheight = 60;

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
    
    NSDictionary *views = @{@"buttonresume":buttonresume, @"buttonexit":buttonexit};
    NSDictionary *metrics = @{@"buttonwidth":@(buttonwidth), @"buttonheight":@(buttonheight)};
    
    self.layoutpauseleftmargin = [NSLayoutConstraint constraintWithItem:buttonresume attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    self.layoutexitleftmargin = [NSLayoutConstraint constraintWithItem:buttonexit attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[buttonresume(buttonwidth)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[buttonexit(buttonwidth)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonresume(buttonheight)]-100-[buttonexit(buttonheight)]" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)layoutSubviews
{
    
    
    [super layoutSubviews];
}

@end