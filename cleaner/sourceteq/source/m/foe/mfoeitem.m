#import "mfoeitem.h"
#import "appdel.h"

static CGFloat const ratiochangedirection = 30;
static NSUInteger const maxspeed = 6;
static NSUInteger const minspeed = 0;

@implementation mfoeitem
{
    NSInteger x;
    NSInteger y;
    NSInteger minx;
    NSInteger maxx;
    NSInteger maxy;
    NSInteger width;
    NSInteger width_2;
    NSInteger height;
    NSInteger height_2;
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
       if(x + width > gunshot.minx)
       {
           if(y < gunshot.maxy)
           {
               if(y + height > gunshot.miny)
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
        
        if(y > maxy)
        {
            [self die:NO];
        }
        else
        {
            NSUInteger shouldchangedirection = arc4random_uniform(ratiochangedirection);
            
            if(!shouldchangedirection)
            {
                direction = arc4random_uniform(3.0) - 1.0;
            }
            
            x += direction;
            
            if(x < minx)
            {
                x = minx;
                direction = 1;
            }
            else if(x > maxx)
            {
                x = maxx;
                direction = -1;
            }
            
            self.spatial.delx = self.spatial.x - x;
            self.spatial.dely = self.spatial.y - y;
            speedcounter = 0;
            
//            [self.spatial render];
        }
    }
}

#pragma mark functionality

-(void)gunshot:(NSInteger)caliber
{
    CGFloat centerx = x + width_2;
    CGFloat centery = y + height_2;
    
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
        [self.model addscore:self.score];
    }
    else
    {
//        NSLog(@"foe achieved");
    }
    
    [self.model.items removeObject:self];
}

#pragma mark public

-(void)spatial:(NSArray<NSNumber*>*)textures width:(NSInteger)newwidth height:(NSInteger)newheight
{
    y = - newheight;
    width = newwidth;
    height = newheight;
    minx = newwidth;
    maxx = screenwidth - (newwidth + newwidth);
    maxy = screenheight;
    self.spatial = [[gfoe alloc] init:textures x:x y:y width:width height:height];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedgunshot:) name:notification_gunshot object:nil];
}

@end