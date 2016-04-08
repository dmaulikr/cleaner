#import "gimage.h"
#import "appdel.h"

static NSInteger const defaultspeed = 30;

@implementation gimage
{
    __weak NSArray<NSNumber*> *textures;
    CGFloat counter;
    NSInteger speed;
    NSInteger currentindex;
    NSInteger speedcounter;
    BOOL random;
}

-(instancetype)init:(NSArray<NSNumber*>*)assets
{
    self = [super init];
    speed = defaultspeed;
    random = NO;
    textures = assets;
    speedcounter = 0;
    
    [self loadedtextures];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedglkmove:(NSNotification*)notification
{
    speedcounter++;
    
    if(speedcounter > speed)
    {
        speedcounter = 0;
        [self nextimage];
    }
}

#pragma mark functionality

-(void)loadedtextures
{
    counter = textures.count;
    
    if(counter > 1)
    {
        currentindex = -1;
        [self nextimage];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
    }
    else
    {
        currentindex = 0;
        [self loadcurrent];
    }
}

-(void)loadcurrent
{
    NSNumber *nextnumber = textures[currentindex];
    self.current = nextnumber.unsignedIntValue;
}

-(void)nextimage
{
    if(random)
    {
        currentindex = arc4random_uniform(counter);
    }
    else
    {
        currentindex++;
        
        if(currentindex >= counter)
        {
            currentindex = 0;
        }
    }
    
    [self loadcurrent];
}

#pragma mark public

-(void)makerandom
{
    random = YES;
}

-(void)animationspeed:(NSInteger)newspeed
{
    speed = newspeed;
}

@end