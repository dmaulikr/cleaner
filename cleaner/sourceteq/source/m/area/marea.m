#import "marea.h"

@implementation marea

-(instancetype)init
{
    self = [super init];
    
    CGFloat rawscreenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat rawscreenheight = [UIScreen mainScreen].bounds.size.height;
    
    if(rawscreenwidth > rawscreenheight)
    {
        self.screenwidth = rawscreenwidth;
        self.screenheight = rawscreenheight;
    }
    else
    {
        self.screenwidth = rawscreenheight;
        self.screenheight = rawscreenwidth;
    }
    
    self.glkarea = [[garea alloc] init:self];
    [self randomcolor];
    [self.glkarea rasterize];
    
    return self;
}

#pragma mark functionality

-(void)randomcolor
{
    NSArray *basecolors = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"areacolors" withExtension:@"plist"]];
}

#pragma mark public

-(GLKMatrix4)asprojectionmatrix
{
    GLKMatrix4 matrix = GLKMatrix4MakeOrtho(0, self.screenwidth, self.screenheight, 0, 1, -1);
    
    return matrix;
}

@end