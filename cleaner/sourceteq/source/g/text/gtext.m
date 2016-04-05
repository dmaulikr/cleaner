#import "gtext.h"

@implementation gtext

#pragma mark -
#pragma mark spatial texture

-(void)rasterize
{
    self.datatexture = [NSMutableData dataWithLength:vectorcorners * sizeof(GLKVector2)];
    self.pointertexture = self.datatexture.mutableBytes;
    self.pointertexture[0] = GLKVector2Make(0, 0);
    self.pointertexture[1] = GLKVector2Make(0, self.atlasheight);
    self.pointertexture[2] = GLKVector2Make(self.atlaswidth, self.atlasheight);
    self.pointertexture[3] = GLKVector2Make(self.atlaswidth, self.atlasheight);
    self.pointertexture[4] = GLKVector2Make(self.atlaswidth, 0);
    self.pointertexture[5] = GLKVector2Make(0, 0);
    
    [super rasterize];
}

@end