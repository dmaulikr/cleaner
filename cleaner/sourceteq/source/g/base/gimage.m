#import "gimage.h"
#import "appdel.h"

static NSUInteger const imagespeed = 30;

@implementation gimage
{
    NSMutableArray<NSNumber*> *textures;
    CGFloat counter;
    NSInteger currentindex;
    NSUInteger speedcounter;
}

-(instancetype)init:(NSArray<NSString*>*)assets
{
    self = [super init];
    self.speed = imagespeed;
    self.random = NO;
    speedcounter = 0;
    [self loadtextures:assets];
    
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
    
    if(speedcounter >= self.speed)
    {
        speedcounter = 0;
        [self nextimage];
    }
}

#pragma mark functionality

-(void)loadtextures:(NSArray<NSString*>*)assets
{
    textures = [NSMutableArray array];
    counter = assets.count;
    
    for(NSUInteger i = 0; i < counter; i++)
    {
        NSString *assetname = assets[i];
        NSNumber *number = [mtextures singleton].textures[assetname];
        [textures addObject:number];
    }
    
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
    if(self.random)
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

@end