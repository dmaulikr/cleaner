#import "gtextnumber.h"

static CGFloat const atlaswidth = 5.375;
static CGFloat const atlasheight = 2.5294;
static NSInteger const glyphwidth = 24;
static NSInteger const glyphheight = 34;
static NSInteger const marginhr = 6;
static NSInteger const marginvr = 7;

@implementation gtextnumber

-(instancetype)init
{
    self = [super init];
    self.width = glyphwidth;
    self.height = glyphheight;
    
    return self;
}

#pragma mark -
#pragma mark spatial texture

-(void)rasterize
{
    self.datatexture = [NSMutableData dataWithLength:vectorcorners * sizeof(GLKVector2)];
    self.pointertexture = self.datatexture.mutableBytes;
    self.pointertexture[0] = GLKVector2Make(0, 0);
    self.pointertexture[1] = GLKVector2Make(0, atlasheight);
    self.pointertexture[2] = GLKVector2Make(atlaswidth, atlasheight);
    self.pointertexture[3] = GLKVector2Make(atlaswidth, atlasheight);
    self.pointertexture[4] = GLKVector2Make(atlaswidth, 0);
    self.pointertexture[5] = GLKVector2Make(0, 0);
    
    [super rasterize];
}

@end