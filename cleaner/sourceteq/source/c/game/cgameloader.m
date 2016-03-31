#import "cgameloader.h"

@interface cgameloader ()

@property(strong, nonatomic)vgameloader *view;

@end

@implementation cgameloader

@dynamic view;

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setExtendedLayoutIncludesOpaqueBars:NO];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    self.firsttime = YES;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    if(self.firsttime)
    {
        self.firsttime = NO;
        [self startloading];
    }
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

-(void)loadView
{
    self.view = [[vgameloader alloc] init:self];
}

#pragma mark functionality

-(void)startloading
{
    self.model = [[mgame alloc] init:self];
}

#pragma mark public

-(void)loadingfinished
{
    [self.view loadfinished];
    [[cmain singleton].pages sectiongamestart:self.model];
}

@end