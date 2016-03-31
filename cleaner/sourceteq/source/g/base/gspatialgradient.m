#import "gspatialgradient.h"

@interface gspatialgradient ()

@property(strong, nonatomic)NSMutableData *datacolor;

@end

@implementation gspatialgradient

-(instancetype)init
{
    self = [super init];
    
    self.datacolor = [NSMutableData dataWithLength:vectorcorners * sizeof(GLKVector2)];
    self.pointercolor = self.datacolor.mutableBytes;
    self.pointercolor[0] = GLKVector2Make(0, 0);
    self.pointercolor[1] = GLKVector2Make(0, 1);
    self.pointercolor[2] = GLKVector2Make(1, 1);
    self.pointercolor[3] = GLKVector2Make(1, 1);
    self.pointercolor[4] = GLKVector2Make(1, 0);
    self.pointercolor[5] = GLKVector2Make(0, 0);
    
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