#import "gspatialgradient.h"
#import "mcolor.h"

@interface gspatialgradient ()

@property(strong, nonatomic)NSMutableData *datacolor;

@end

@implementation gspatialgradient

#pragma mark -
#pragma mark spatial

-(void)rasterize
{
    self.datacolor = [NSMutableData dataWithLength:vectorcorners * sizeof(GLKVector4)];
    self.pointercolor = self.datacolor.mutableBytes;
    self.pointercolor[0] = [self.colorlefttop asvector];
    self.pointercolor[1] = [self.colorleftbottom asvector];
    self.pointercolor[2] = [self.colorrightbottom asvector];
    self.pointercolor[3] = [self.colorrightbottom asvector];
    self.pointercolor[4] = [self.colorrighttop asvector];
    self.pointercolor[5] = [self.colorlefttop asvector];
    
    [super rasterize];
}

-(void)draw:(GLKBaseEffect*)effect
{
    glEnableVertexAttribArray(GLKVertexAttribColor);
    glVertexAttribPointer(GLKVertexAttribColor, 2, GL_FLOAT, GL_FALSE, 0, self.pointercolor);

    [super draw:effect];
    
    glDisableVertexAttribArray(GLKVertexAttribColor);
}

@end