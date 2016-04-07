#import "gspatial.h"
#import "appdel.h"

@implementation gspatial

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

#pragma mark public

-(void)vector:(NSUInteger)index x:(CGFloat)x y:(CGFloat)y
{
    [self.dataposition appendData:[NSMutableData dataWithLength:sizeof(GLKVector2)]];
    self.pointerposition = self.dataposition.mutableBytes;
    self.pointerposition[index] = GLKVector2Make(x, y);
}

-(void)draw:(GLKBaseEffect*)effect
{
    effect.transform.projectionMatrix = self.projectionmatrix;
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, self.pointerposition);
    [effect prepareToDraw];
    glDrawArrays(GL_TRIANGLES, 0, vectorcorners);
}

-(void)rasterize
{
    [self firstrender];
}

-(void)render
{
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

-(void)firstrender
{
    self.projectionmatrix = GLKMatrix4MakeOrtho(0, self.model.model.modelarea.screenwidth, self.model.model.modelarea.screenheight, 0, 1, -1);
    [self render];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkdraw:) name:notification_glkdraw object:nil];
}

-(void)movetotop
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:notification_glkdraw object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkdraw:) name:notification_glkdraw object:nil];
}

@end