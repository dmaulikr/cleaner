#import "gspatial.h"
#import "appdel.h"

@implementation gspatial
{
    NSMutableData *dataposition;
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

-(void)updateprojection:(NSInteger)dx dy:(NSInteger)dy
{
    projection = GLKMatrix4Translate(projection, dx, dy, 0);
}

-(void)vector:(NSUInteger)index x:(NSInteger)x y:(NSInteger)y
{
    [dataposition appendData:[NSMutableData dataWithLength:sizeof(GLKVector2)]];
    
    
}

-(void)render
{
    NSInteger minx = self.x;
    NSInteger maxx = minx + self.width;
    NSInteger miny = self.y;
    NSInteger maxy = miny + self.height;
    
    projection = projectionbase;
    dataposition = [NSMutableData dataWithLength:lengthdatapos];
    pointerposition = dataposition.mutableBytes;
    pointerposition[0] = GLKVector2Make(minx, miny);
    pointerposition[1] = GLKVector2Make(minx, maxy);
    pointerposition[2] = GLKVector2Make(maxx, maxy);
    pointerposition[3] = GLKVector2Make(maxx, maxy);
    pointerposition[4] = GLKVector2Make(maxx, miny);
    pointerposition[5] = GLKVector2Make(minx, miny);
    
    [self movetotop];
}

-(void)movetotop
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:notification_glkdraw object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(draw) name:notification_glkdraw object:nil];
}

@end