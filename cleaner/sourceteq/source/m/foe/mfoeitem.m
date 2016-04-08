#import "mfoeitem.h"
#import "appdel.h"

static CGFloat const ratiochangedirection = 30;
static NSUInteger const maxspeed = 10;
static NSUInteger const minspeed = 0;

@implementation mfoeitem
{
    gfoe *spatial;
    NSInteger x;
    NSInteger y;
    NSInteger direction;
    NSUInteger speed;
    NSUInteger speedcounter;
}

-(instancetype)init:(mfoe*)model x:(NSInteger)newx
{
    self = [super init];
    self.model = model;
    x = newx;
    speed = arc4random_uniform(maxspeed) + minspeed;
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedgunshot:(NSNotification*)notification
{
    mgunshot *gunshot = (mgunshot*)notification.userInfo;
    
    if(x < gunshot.maxx)
    {
       if(x + foewidth > gunshot.minx)
       {
           if(y < gunshot.maxy)
           {
               if(y + foeheight > gunshot.miny)
               {
                   [self gunshot:gunshot.caliber];
               }
           }
       }
    }
}

-(void)notifiedglkmove:(NSNotification*)notification
{
    speedcounter++;
    
    if(speedcounter > speed)
    {
        y++;
        
        if(y > foemaxy)
        {
            [self die:NO];
        }
        else
        {
            NSUInteger shouldchangedirection = arc4random_uniform(ratiochangedirection);
            
            if(!shouldchangedirection)
            {
                direction = arc4random_uniform(3) - 1.0;
            }
            
            if(x < foeminx)
            {
                direction = 1;
            }
            else if(x > foemaxx)
            {
                direction = -1;
            }
            
            x += direction;
            speedcounter = 0;
            [spatial updateprojection:direction dy:+1];
        }
    }
}

#pragma mark functionality

-(void)gunshot:(NSInteger)caliber
{
    CGFloat centerx = x + foewidth_2;
    CGFloat centery = y + foeheight_2;
    
    [self.model.modeleffect shotatx:centerx y:centery];
    self.life -= caliber;
    
    if(self.life < 1)
    {
        [self.model.modeleffect smokeatx:centerx y:centery];
        [self die:YES];
        
        NSString *scoretext = [[tools singleton] numbertostring:@(self.score)];
        [self.model.modeltext addscoretext:scoretext x:centerx y:y];
    }
}

-(void)die:(BOOL)points
{
    if(points)
    {
        [self.model.modelscorer addscore:self.score];
    }
    else
    {
//        NSLog(@"foe achieved");
    }
    
    [self.model.items removeObject:self];
}

#pragma mark public

-(void)spatial:(NSArray<NSNumber*>*)textures
{
    y = -foeheight;
    spatial = [[gfoe alloc] init:textures x:x y:y];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedgunshot:) name:notification_gunshot object:nil];
}

@end