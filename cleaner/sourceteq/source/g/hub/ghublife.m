#import "ghublife.h"

@implementation ghublife

-(instancetype)init:(mtextures*)modeltextures
{
    self = [super init];
    [self.image loadtextures:@[@"hub_life"] model:modeltextures];
    
    return self;
}

@end