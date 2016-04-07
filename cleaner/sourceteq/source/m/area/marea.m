#import "marea.h"

static CGFloat const deltalefttop = -0.9;
static CGFloat const deltaleftbottom = -0.4;
static CGFloat const deltarighttop = -0.9;
static CGFloat const deltarightbottom = -0.4;
static CGFloat const ratioadddust = 100;

@implementation marea

-(instancetype)init:(mtextures*)modeltextures
{
    self = [super init];
    self.modeltextures = modeltextures;
    
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
    
    self.centerx = self.screenwidth / 2.0;
    self.centery = self.screenheight / 2.0;
    [self rasterize];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedglkmove:(NSNotification*)notification
{
    NSUInteger shouldadd = arc4random_uniform(ratioadddust);
    
    if(!shouldadd)
    {
        [self.modeldust add];
    }
    
    [self.spatial movetotop];
}

#pragma mark functionality

-(void)randomcolor
{
    NSArray *basecolors = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"areacolors" withExtension:@"plist"]];
    CGFloat count = basecolors.count;
    NSUInteger index = arc4random_uniform(count);
    NSDictionary *basecolor = basecolors[index];
    self.spatial.colorlefttop = [mcolor basecolor:basecolor delta:deltalefttop];
    self.spatial.colorleftbottom = [mcolor basecolor:basecolor delta:deltaleftbottom];
    self.spatial.colorrighttop = [mcolor basecolor:basecolor delta:deltarighttop];
    self.spatial.colorrightbottom = [mcolor basecolor:basecolor delta:deltarightbottom];
}

#pragma mark public

-(void)rasterize
{
    self.modeldust = [[mareadust alloc] init:self];
    self.spatial = [[garea alloc] init:self];
    [self randomcolor];
    [self.spatial rasterize];
}

-(GLKMatrix4)asprojectionmatrix
{
    GLKMatrix4 matrix = GLKMatrix4MakeOrtho(0, self.screenwidth, self.screenheight, 0, 1, -1);
    
    return matrix;
}

@end