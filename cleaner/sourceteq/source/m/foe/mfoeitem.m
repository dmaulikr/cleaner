#import "mfoeitem.h"

@implementation mfoeitem

-(instancetype)init:(NSDictionary*)dictionary
{
    self = [super init];
    self.spatial = [[gfoe alloc] init:self];

    NSArray *assets = dictionary[@"assets"];
    CGFloat width = [dictionary[@"width"] floatValue];
    CGFloat height = [dictionary[@"height"] floatValue];
    
    self.spatial.width = width;
    self.spatial.height = height;
    self.spatial.y = -height;
    [self.spatial.image loadtextures:assets];
    
    return self;
}

#pragma mark public

-(void)rasterize:(CGFloat)x
{
    self.spatial.x = x;
    [self.spatial rasterize];
}

@end