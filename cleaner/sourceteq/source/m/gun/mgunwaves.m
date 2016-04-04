#import "mgunwaves.h"

static CGFloat const maxwaveheight = 20;
static NSInteger const minwaveheight = 4;
static NSInteger const wavewidth = 4;

@implementation mgunwaves

-(instancetype)init
{
    self = [super init];
    
    return self;
}

#pragma mark public

-(void)restart:(CGFloat)initx inity:(CGFloat)inity centerx:(CGFloat)centerx centery:(CGFloat)centery finalx:(CGFloat)finalx finaly:(CGFloat)finaly
{
    self.items = [NSMutableArray array];
    
    ggunwaves *wave = [[ggunwaves alloc] init:initx miny:inity maxx:centerx maxy:centery];
    [self.items addObject:wave];
}

-(void)clear
{
    self.items = nil;
}


@end