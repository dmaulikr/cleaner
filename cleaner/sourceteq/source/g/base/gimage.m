#import "gimage.h"
#import "appdel.h"

static NSUInteger const imagespeed = 30;

@interface gimage ()

@property(strong, nonatomic)NSMutableArray<NSNumber*> *textures;

@end

@implementation gimage
{
    CGFloat counter;
    NSInteger currentindex;
    NSUInteger speedcounter;
}

-(instancetype)init:(NSArray<NSString*>*)assets
{
    self = [super init];
    self.speed = imagespeed;
    self.textures = [NSMutableArray array];
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
    __weak typeof(self) weakself = self;
    counter = textures.count;
    
    for(NSInteger i = 0; i < counter; i++)
    {
        NSString *texturename = textures[i];
        NSNumber *number = [modeltextures textureforasset:texturename srgb:self.srgb];
        [weakself.textures addObject:number];
    }
    
    if(counter > 1)
    {
        currentindex = -1;
        [weakself nextimage];
        [[NSNotificationCenter defaultCenter] addObserver:weakself selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
    }
    else
    {
        currentindex = 0;
        [weakself loadcurrent];
    }
}

-(void)loadcurrent
{
    NSNumber *nextnumber = self.textures[currentindex];
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