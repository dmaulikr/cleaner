#import "gfoeocto.h"

@implementation gfoeocto

@dynamic model;

-(instancetype)init:(mfoeitemocto*)model
{
    self = [super init:model];
    self.x = 500;
    self.y = 300;
    self.width = 30;
    self.height = 30;
    [self.image loadtextures:@[@"foe_octo0", @"foe_octo1", @"foe_octo2"]];
    [self rasterize];
    
    return self;
}

@end