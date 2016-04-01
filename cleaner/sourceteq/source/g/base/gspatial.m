#import "gspatial.h"
#import "appdel.h"

@interface gspatial ()

@property(strong, nonatomic)NSMutableData *dataposition;

@end

@implementation gspatial

-(instancetype)init
{
    self = [super init];
    self.repos = NO;
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notifications

-(void)notifiedglkdraw:(NSNotification*)notification
{
    mgameeffect *modeleffect = (mgameeffect*)notification.userInfo;
    GLKBaseEffect *effect = modeleffect.effect;
    [self draw:effect];
}

-(void)notifiedglkmove:(NSNotification*)notification
{
    if(self.repos)
    {
        [self render];
    }
}

#pragma mark functionality

-(void)vector:(NSUInteger)index x:(CGFloat)x y:(CGFloat)y
{
    [self.dataposition appendData:[NSMutableData dataWithLength:sizeof(GLKVector2)]];
    self.pointerposition = self.dataposition.mutableBytes;
    self.pointerposition[index] = GLKVector2Make(x, y);
}

#pragma mark public

-(void)draw:(GLKBaseEffect*)effect
{
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, self.pointerposition);
    [effect prepareToDraw];
    glDrawArrays(GL_TRIANGLES, 0, vectorcorners);
}

-(void)rasterize
{
    [self render];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkdraw:) name:notification_glkdraw object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
}

-(void)render
{
    self.repos = NO;
    self.dataposition = [NSMutableData data];
    
    NSUInteger index = 0;
    CGFloat minx = self.x;
    CGFloat maxx = minx + self.width;
    CGFloat miny = self.y;
    CGFloat maxy = miny + self.height;
    
    [self vector:index++ x:minx y:miny];
    [self vector:index++ x:minx y:maxy];
    [self vector:index++ x:maxx y:maxy];
    [self vector:index++ x:maxx y:maxy];
    [self vector:index++ x:maxx y:miny];
    [self vector:index++ x:minx y:miny];
}

@end