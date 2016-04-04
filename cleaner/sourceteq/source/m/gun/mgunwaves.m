#import "mgunwaves.h"

static CGFloat const maxwavelong = 20;
static NSInteger const minwavelong = 4;
static NSInteger const waveshort = 4;

@implementation mgunwaves
{
    NSInteger waveshort_2;
}

-(instancetype)init
{
    self = [super init];
    waveshort_2 = waveshort / 2.0;
    
    return self;
}

#pragma mark public

-(void)restart:(CGFloat)initx inity:(CGFloat)inity centerx:(CGFloat)centerx centery:(CGFloat)centery finalx:(CGFloat)finalx finaly:(CGFloat)finaly
{
    self.items = [NSMutableArray array];
    NSInteger auxx = initx;
    NSInteger auxy = inity;
    
    CGFloat angle = atan((finaly - inity) / (finalx - initx));
    NSLog(@"%@", @(angle));
    
    while(auxx < finalx)
    {
        NSInteger randomwave = arc4random_uniform(maxwavelong) + minwavelong;
        NSInteger randomwave_2 = randomwave / 2.0;
        auxx += waveshort;
        
        ggunwaves *wave = [[ggunwaves alloc] init:angle x:auxx - waveshort_2 y:auxy - randomwave_2 width:waveshort height:randomwave];
        [self.items addObject:wave];
    }
}

-(void)clear
{
    self.items = nil;
}


@end