#import "mfoe.h"

static NSUInteger const speedaddfoe = 100;

@implementation mfoe
{
    NSUInteger counteraddfoe;
}

-(instancetype)init:(marea*)modelarea
{
    self = [super init];
    self.modelarea = modelarea;
    self.items = [NSMutableArray array];
    self.rawfoes = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"foes" withExtension:@"plist"]];
    counteraddfoe = 0;
    
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
    counteraddfoe++;
    
    if(counteraddfoe >= speedaddfoe)
    {
        counteraddfoe = 0;
        [self addfoe];
        [self.modelarea.spatial movetotop];
    }
}

#pragma mark public

-(void)addfoe
{
    NSUInteger index = arc4random_uniform((CGFloat)self.rawfoes.count);
    NSDictionary *rawfoe = self.rawfoes[index];
    mfoeitem *foe = [[mfoeitem alloc] init:rawfoe];
    CGFloat maxx = self.modelarea.screenwidth - foe.spatial.width;
    CGFloat maxy = self.modelarea.screenheight - foe.spatial.height;
    CGFloat x = arc4random_uniform(maxx);
    CGFloat y = arc4random_uniform(maxy);
    
    [foe initialx:x y:y];
    [self.items addObject:foe];
}

@end