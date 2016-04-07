#import "marea.h"

static CGFloat const deltalefttop = -0.9;
static CGFloat const deltaleftbottom = -0.4;
static CGFloat const deltarighttop = -0.9;
static CGFloat const deltarightbottom = -0.4;
static CGFloat const ratioadddust = 100;

GLKMatrix4 projectionbase;
NSInteger screenwidth;
NSInteger screenheight;

@implementation marea
{
    mareadust *modeldust;
    garea *spatial;
}

-(instancetype)init
{
    self = [super init];
    
    CGFloat rawscreenwidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat rawscreenheight = [UIScreen mainScreen].bounds.size.height;
    
    if(rawscreenwidth > rawscreenheight)
    {
        screenwidth = rawscreenwidth;
        screenheight = rawscreenheight;
    }
    else
    {
        screenwidth = rawscreenheight;
        screenheight = rawscreenwidth;
    }
    
    projectionbase = GLKMatrix4MakeOrtho(0, screenwidth, screenheight, 0, 1, -1);
    [self render];
    
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
        [modeldust add];
    }
    
    [spatial movetotop];
}

#pragma mark functionality

-(void)render
{
    NSArray *basecolors = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"areacolors" withExtension:@"plist"]];
    CGFloat count = basecolors.count;
    NSUInteger index = arc4random_uniform(count);
    NSDictionary *basecolor = basecolors[index];
    mcolor *lefttop = [mcolor basecolor:basecolor delta:deltalefttop];
    mcolor *leftbottom = [mcolor basecolor:basecolor delta:deltaleftbottom];
    mcolor *righttop = [mcolor basecolor:basecolor delta:deltarighttop];
    mcolor *rightbottom = [mcolor basecolor:basecolor delta:deltarightbottom];
    
    modeldust = [[mareadust alloc] init];
    spatial = [[garea alloc] init:lefttop leftbottom:leftbottom righttop:righttop rightbottom:rightbottom];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
}

@end