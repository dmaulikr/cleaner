#import "marea.h"

static CGFloat const deltalefttop = -0.5;
static CGFloat const deltaleftbottom = -0.3;
static CGFloat const deltarighttop = -0.5;
static CGFloat const deltarightbottom = -0.3;

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
    CGFloat count = basecolors.count;
    NSUInteger index = arc4random_uniform(count);
    NSDictionary *basecolor = basecolors[index];
    self.glkarea.colorlefttop = [mcolor basecolor:basecolor delta:deltalefttop];
    self.glkarea.colorleftbottom = [mcolor basecolor:basecolor delta:deltaleftbottom];
    self.glkarea.colorrighttop = [mcolor basecolor:basecolor delta:deltarighttop];
    self.glkarea.colorrightbottom = [mcolor basecolor:basecolor delta:deltarightbottom];
}

#pragma mark public

-(GLKMatrix4)asprojectionmatrix
{
    GLKMatrix4 matrix = GLKMatrix4MakeOrtho(0, self.screenwidth, self.screenheight, 0, 1, -1);
    
    return matrix;
}

@end