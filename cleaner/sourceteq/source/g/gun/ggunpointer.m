#import "ggunpointer.h"

static CGFloat const minsize = 20;
static CGFloat const maxsize = 70;

@implementation ggunpointer

-(instancetype)init
{
    self = [super init];
    [self.image loadtextures:@[@"gun_pointer"]];
    
    return self;
}

#pragma mark -
#pragma mark gun protocol

-(void)centeronx:(NSInteger)x y:(NSInteger)y focused:(BOOL)focused
{
    CGFloat size;
    CGFloat size_2;
    
    if(focused)
    {
        size = minsize;
    }
    else
    {
        size = maxsize;
    }
    
    size_2 = size / 2.0;
    self.width = size;
    self.height = size;
    self.x = x - size_2;
    self.y = y - size_2;
    
    [self render];
}

@end