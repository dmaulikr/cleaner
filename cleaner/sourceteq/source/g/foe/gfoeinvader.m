#import "gfoeinvader.h"

@implementation gfoeinvader

@dynamic model;

-(instancetype)init:(mfoeiteminvader*)model
{
    self = [super init:model];
    self.x = 300;
    self.y = 300;
    self.width = 30;
    self.height = 30;
    [self.image loadtextures:@[@"foe_invader0", @"foe_invader1", @"foe_invader2"]];
    [self rasterize];
    
    return self;
}

@end