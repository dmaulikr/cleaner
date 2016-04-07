#import "gspatial.h"
#import "appdel.h"

@interface gspatial ()

@property(strong, nonatomic)NSMutableData *dataposition;

@end

@implementation gspatial
{
    GLKVector2 *pointerposition;
    GLKMatrix4 projection;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark public

-(void)draw
{
    effect.transform.projectionMatrix = projection;
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, 0, pointerposition);
    [effect prepareToDraw];
    glDrawArrays(GL_TRIANGLES, 0, vectorcorners);
}

-(void)updateprojection
{
    projection = GLKMatrix4Translate(projection, self.dx, self.dy, 0);
}

-(void)vector:(NSUInteger)index x:(NSInteger)x y:(NSInteger)y
{
    [self.dataposition appendData:[NSMutableData dataWithLength:sizeof(GLKVector2)]];
    pointerposition = self.dataposition.mutableBytes;
    pointerposition[index] = GLKVector2Make(x, y);
}

-(void)render
{
    self.dx = 0;
    self.dy = 0;
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
    
    [self updateprojection];
    [self movetotop];
}

-(void)movetotop
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:notification_glkdraw object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(draw) name:notification_glkdraw object:nil];
}

@end