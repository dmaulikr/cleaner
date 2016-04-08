#import "cgame.h"

static NSUInteger const framespersecond = 60;

@interface cgame ()

@property(strong, nonatomic)vgame *view;

@end

@implementation cgame

@dynamic view;
@dynamic delegate;

-(instancetype)init:(mgame*)model
{
    self = [super init];
    self.model = model;
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setPauseOnWillResignActive:YES];
    [self setPreferredFramesPerSecond:framespersecond];
    [self setResumeOnDidBecomeActive:NO];
    [self setDelegate:self];
}

-(void)loadView
{
    self.view = [[vgame alloc] init:self];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark public

-(void)exitgame
{
    [[cmain singleton].pages sectionhome:YES direction:UIPageViewControllerNavigationDirectionReverse];
}

#pragma mark -
#pragma mark glk del

-(void)glkViewController:(GLKViewController*)controller willPause:(BOOL)pause
{
    if(pause)
    {
        [self.view pause];
    }
}

-(void)glkViewControllerUpdate:(GLKViewController*)controller
{
    [[NSNotificationCenter defaultCenter] postNotificationName:notification_glkmove object:nil];
}

@end