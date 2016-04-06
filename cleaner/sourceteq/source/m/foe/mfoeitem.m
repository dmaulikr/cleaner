#import "mfoeitem.h"

static CGFloat const maxspeed = 3;
static CGFloat const ratiochangedirection = 30;
static NSUInteger const minspeed = 0;

@implementation mfoeitem
{
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
    CGFloat width = [dictionary[@"width"] floatValue];
    CGFloat height = [dictionary[@"height"] floatValue];
    self.score = self.life = [dictionary[@"life"] integerValue];
    self.spatial.width = width;
    self.spatial.height = height;
    self.spatial.y = -height;
    [self.spatial.image loadtextures:assets];
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
    
    CGFloat spatialx = self.spatial.x;
    CGFloat spatialy = self.spatial.y;
    
    if(spatialx < gunshot.maxx)
    {
       if(spatialx + self.spatial.width > gunshot.minx)
       {
           if(spatialy < gunshot.maxy)
           {
               if(spatialy + self.spatial.height > gunshot.miny)
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
        BOOL remove = NO;
        self.spatial.y++;
        
        if(self.spatial.y > self.model.modelarea.screenheight)
        {
            remove = YES;
        }
        else if(self.spatial.x < - self.spatial.width)
        {
            remove = YES;
        }
        else if(self.spatial.x > self.model.modelarea.screenwidth)
        {
            remove = YES;
        }
        
        if(remove)
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
            
            self.spatial.x += direction;
            speedcounter = 0;
            
            [self.spatial render];
        }
    }
}

#pragma mark functionality

-(void)gunshot:(NSInteger)caliber
{
    CGFloat x = self.spatial.x + (self.spatial.width / 2.0);
    CGFloat y = self.spatial.y + (self.spatial.height / 2.0);
    
    [self.model.modeleffect shotatx:x y:y];
    self.life -= caliber;
    
    if(self.life < 1)
    {
        [self.model.modeleffect smokeatx:x y:y];
        [self die:YES];
        
        NSString *scoretext = [[tools singleton] numbertostring:@(self.score)];
        [self.model.modeltext addscoretext:scoretext x:x y:self.spatial.y];
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
    
    [self.model.items removeObject:self];
}

#pragma mark public

-(void)rasterize:(CGFloat)x
{
    self.spatial.x = x;
    [self.spatial rasterize];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedgunshot:) name:notification_gunshot object:nil];
}

@end