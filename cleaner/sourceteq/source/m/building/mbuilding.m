#import "mbuilding.h"

@implementation mbuilding

-(instancetype)init:(mtextures*)modeltextures area:(marea*)modelarea
{
    self = [super init];
    self.modeltextures = modeltextures;
    self.modelarea = modelarea;
    self.items = [NSMutableArray array];
    self.rawbuldings = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"buildings" withExtension:@"plist"]];

    [self addbuilding:50];
    [self addbuilding:400];
    
    return self;
}

#pragma mark public

-(void)addbuilding:(CGFloat)x
{
    NSUInteger index = arc4random_uniform((CGFloat)self.rawbuldings.count);
    NSDictionary *rawbuilding = self.rawbuldings[index];
    mbuildingitem *building = [[mbuildingitem alloc] init:self.modeltextures dictionary:rawbuilding];
    building.spatial.x = x;
    building.spatial.y = self.modelarea.screenheight - building.spatial.height;
    [building.spatial rasterize];
    
    [self.items addObject:building];
}

@end