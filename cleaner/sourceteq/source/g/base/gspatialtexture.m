#import "gspatialtexture.h"

@interface gspatial ()

@property(strong, nonatomic)NSMutableData *datatexture;

@end

@implementation gspatialtexture

-(instancetype)init
{
    self = [super init];
    
    self.datatexture = [NSMutableData dataWithLength:vectorcorners * sizeof(GLKVector2)];
    self.pointertexture = self.datatexture.mutableBytes;
    self.pointertexture[0] = GLKVector2Make(0, 0);
    self.pointertexture[1] = GLKVector2Make(0, 1);
    self.pointertexture[2] = GLKVector2Make(1, 1);
    self.pointertexture[3] = GLKVector2Make(1, 1);
    self.pointertexture[4] = GLKVector2Make(1, 0);
    self.pointertexture[5] = GLKVector2Make(0, 0);
    self.image = [[gimage alloc] init];
    
    return self;
}

@end