#import "gspatial.h"
#import "appdel.h"

@implementation gspatial

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark public

-(void)notifiedglkdraw:(NSNotification*)notification
{
    effect.transform.projectionMatrix = self.projection;
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, self.pointerposition);
    [effect prepareToDraw];
    glDrawArrays(GL_TRIANGLES, 0, vectorcorners);
}

-(void)vector:(NSUInteger)index x:(NSInteger)x y:(NSInteger)y
{
    [self.dataposition appendData:[NSMutableData dataWithLength:sizeof(GLKVector2)]];
    self.pointerposition = self.dataposition.mutableBytes;
    self.pointerposition[index] = GLKVector2Make(x, y);
}

-(void)render
{
    self.dataposition = [NSMutableData data];
    
    NSUInteger index = 0;
    NSInteger minx = self.x;
    NSInteger maxx = minx + self.width;
    NSInteger miny = self.y;
    NSInteger maxy = miny + self.height;
    
    [self vector:index++ x:minx y:miny];
    [self vector:index++ x:minx y:maxy];
    [self vector:index++ x:maxx y:maxy];
    [self vector:index++ x:maxx y:maxy];
    [self vector:index++ x:maxx y:miny];
    [self vector:index++ x:minx y:miny];
    
    self.projection = projectionbase;
    [self render];
    [self movetotop];
}

-(void)movetotop
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:notification_glkdraw object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkdraw:) name:notification_glkdraw object:nil];
}

@end