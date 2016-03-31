#import "gfoeocto.h"

@implementation gfoeocto

@dynamic model;

-(instancetype)init:(mfoeitemocto*)model
{
    self = [super init:model];
    self.x = 200;
    self.y = 200;
    self.width = 50;
    self.height = 50;
    [self.image loadtextures:@[@"foe_octo0", @"foe_octo1", @"foe_octo2"]];
    [self render];
    
    return self;
}

@end