#import "vgamepause.h"

static NSUInteger const buttonwidth = 140;
static NSUInteger const buttonheight = 36;
static NSUInteger const buttonseparation = 50;

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
    [buttonresume.layer setCornerRadius:4];
    [buttonresume setBackgroundColor:[UIColor main]];
    [buttonresume setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonresume setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [buttonresume setTitle:NSLocalizedString(@"game_pause_resume", nil) forState:UIControlStateNormal];
    
    UIButton *buttonexit = [[UIButton alloc] init];
    [buttonexit setClipsToBounds:YES];
    [buttonexit setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonexit.layer setCornerRadius:4];
    [buttonexit setBackgroundColor:[UIColor second]];
    [buttonexit setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonexit setTitleColor:[UIColor colorWithWhite:1 alpha:0.2] forState:UIControlStateHighlighted];
    [buttonexit setTitle:NSLocalizedString(@"game_pause_exit", nil) forState:UIControlStateNormal];
    
    [self addSubview:buttonresume];
    [self addSubview:buttonexit];
    
    NSDictionary *views = @{@"buttonresume":buttonresume, @"buttonexit":buttonexit};
    NSDictionary *metrics = @{@"buttonwidth":@(buttonwidth), @"buttonheight":@(buttonheight), @"buttonseparation":@(buttonseparation)};
    
    self.layoutpauseleftmargin = [NSLayoutConstraint constraintWithItem:buttonresume attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    self.layoutpausetopmargin = [NSLayoutConstraint constraintWithItem:buttonresume attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    self.layoutexitleftmargin = [NSLayoutConstraint constraintWithItem:buttonexit attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[buttonresume(buttonwidth)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[buttonexit(buttonwidth)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonresume(buttonheight)]-(buttonseparation)-[buttonexit(buttonheight)]" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)layoutSubviews
{
    CGFloat width = self.bounds.size.width;
    CGFloat width_button = width - buttonwidth;
    CGFloat margin = width_button / 2.0;
    
    CGFloat height = self.bounds.size.height;
    CGFloat buttonsvertical = buttonseparation + buttonheight + buttonheight;
    CGFloat height_vertical = height - buttonsvertical;
    CGFloat marginvertical = height_vertical / 2.0;
    
    self.layoutpauseleftmargin.constant = margin;
    self.layoutexitleftmargin.constant = margin;
    self.layoutpausetopmargin.constant = marginvertical;
    
    [super layoutSubviews];
}

@end