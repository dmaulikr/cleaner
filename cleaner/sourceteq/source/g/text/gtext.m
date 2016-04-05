#import "gtext.h"

@implementation gtext

-(instancetype)init:(mtextitemglyph*)model
{
    self = [super init];
    self.x = model.x;
    self.y = model.y;
    self.width = model.width;
    self.height = model.height;
    self.atlaswidth = model.atlaswidth;
    self.atlasheight = model.atlasheight;
    self.leftmargin = model.leftmargin;
    self.topmargin = model.topmargin;
    [self.image loadtextures:@[model.assetname]];
    [self rasterize];
    
    return self;
}

#pragma mark -
#pragma mark spatial texture

-(void)rasterize
{
    self.datatexture = [NSMutableData dataWithLength:vectorcorners * sizeof(GLKVector2)];
    self.pointertexture = self.datatexture.mutableBytes;
    self.pointertexture[0] = GLKVector2Make(self.leftmargin, self.topmargin);
    self.pointertexture[1] = GLKVector2Make(self.leftmargin, self.atlasheight);
    self.pointertexture[2] = GLKVector2Make(self.atlaswidth, self.atlasheight);
    self.pointertexture[3] = GLKVector2Make(self.atlaswidth, self.atlasheight);
    self.pointertexture[4] = GLKVector2Make(self.atlaswidth, self.topmargin);
    self.pointertexture[5] = GLKVector2Make(self.leftmargin, self.topmargin);
    
    [super firstrender];
}

@end