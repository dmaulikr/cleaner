#import "gspatialgradient.h"
#import "appdel.h"

@implementation gspatialgradient
{
    NSMutableData *datacolor;
    GLKVector4 *pointercolor;
    mcolor *colorlefttop;
    mcolor *colorleftbottom;
    mcolor *colorrighttop;
    mcolor *colorrightbottom;
}

-(instancetype)init:(mcolor*)lefttop leftbottom:(mcolor*)leftbottom righttop:(mcolor*)righttop rightbottom:(mcolor*)rightbottom
{
    self = [super init];
    colorlefttop = lefttop;
    colorleftbottom = leftbottom;
    colorrighttop = righttop;
    colorrightbottom = rightbottom;
    
    return self;
}

#pragma mark -
#pragma mark spatial

-(void)render
{
    datacolor = [NSMutableData dataWithLength:6 * sizeof(GLKVector4)];
    pointercolor = datacolor.mutableBytes;
    pointercolor[0] = [colorlefttop asvector];
    pointercolor[1] = [colorleftbottom asvector];
    pointercolor[2] = [colorrightbottom asvector];
    pointercolor[3] = [colorrightbottom asvector];
    pointercolor[4] = [colorrighttop asvector];
    pointercolor[5] = [colorlefttop asvector];
    
    [super render];
}

-(void)draw
{
    effect.texture2d0.enabled = NO;
    glEnableVertexAttribArray(GLKVertexAttribColor);
    glVertexAttribPointer(GLKVertexAttribColor, 4, GL_FLOAT, GL_FALSE, 0, pointercolor);
    
    [super draw];
    
    glDisableVertexAttribArray(GLKVertexAttribColor);
}

@end