#import "gspatialgradient.h"
#import "mcolor.h"

@interface gspatialgradient ()

@property(strong, nonatomic)NSMutableData *datacolor;

@end

@implementation gspatialgradient

-(instancetype)init
{
    self = [super init];
    
    self.datacolor = [NSMutableData dataWithLength:vectorcorners * sizeof(GLKVector2)];
    self.pointercolor = self.datacolor.mutableBytes;
    self.pointercolor[0] = [self.colorlefttop asvector];
    self.pointercolor[1] = [self.colorleftbottom asvector];
    self.pointercolor[2] = [self.colorrightbottom asvector];
    self.pointercolor[3] = [self.colorrightbottom asvector];
    self.pointercolor[4] = [self.colorrighttop asvector];
    self.pointercolor[5] = [self.colorlefttop asvector];
    
    return self;
}

#pragma mark -
#pragma mark spatial

-(void)draw:(GLKBaseEffect*)effect
{
    glEnableVertexAttribArray(GLKVertexAttribColor);
    glVertexAttribPointer(GLKVertexAttribColor, 2, GL_FLOAT, GL_FALSE, 0, self.pointercolor);
    
    [super draw:effect];
    
    glDisable(GLKVertexAttribColor);
}

@end