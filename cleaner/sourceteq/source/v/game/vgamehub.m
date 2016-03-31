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
    
    return self;
}

#pragma mark gestures

#pragma mark functionality

@end