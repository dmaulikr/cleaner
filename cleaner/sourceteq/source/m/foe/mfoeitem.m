#import "mfoeitem.h"

static CGFloat const maxspeed = 6;
static CGFloat const ratiochangedirection = 30;
static NSUInteger const minspeed = 0;

@implementation mfoeitem
{
    CGFloat x;
    CGFloat y;
    CGFloat minx;
    CGFloat maxx;
    CGFloat maxy;
    CGFloat width;
    CGFloat width_2;
    CGFloat height;
    CGFloat height_2;
    NSInteger direction;
    NSUInteger speed;
    NSUInteger speedcounter;
}

-(instancetype)init:(NSDictionary*)dictionary model:(mfoe*)model
{
    self = [super init];
    self.model = model;
    self.spatial = [[gfoe alloc] init:self];
    
    NSArray *assets = dictionary[@"assets"];
    width = [dictionary[@"width"] floatValue];
    width_2 = width / 2.0;
    height = [dictionary[@"height"] floatValue];
    height_2 = height / 2.0;
    
    minx = width;
    maxx = model.modelarea.screenwidth - (width + width);
    maxy = model.modelarea.screenheight;
    self.score = self.life = [dictionary[@"life"] integerValue];
    self.spatial.width = width;
    self.spatial.height = height;
    self.spatial.y = y = -height;
    [self.spatial.image loadtextures:assets model:self.model.modelgame.modeltextures];
    [self choosedirection];
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
                [self choosedirection];
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

-(void)choosedirection
{
    direction = arc4random_uniform(3.0) - 1.0;
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

-(void)rasterize:(CGFloat)newx
{
    self.spatial.x = x = newx;
    [self.spatial rasterize];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedgunshot:) name:notification_gunshot object:nil];
}

@end