#import "mgunwaves.h"

static CGFloat const maxwavelong = 20;
static NSInteger const minwavelong = 1;
static NSInteger const waveshort = 2;
static NSInteger const interitem = 2;
static NSInteger const maxttl = 3;

@implementation mgunwaves
{
    NSInteger waveshort_2;
    NSInteger ttl;
}

-(instancetype)init
{
    self = [super init];
    waveshort_2 = waveshort / 2.0;
    ttl = 0;
    
    return self;
}

#pragma mark public

-(void)restart:(CGFloat)initx inity:(CGFloat)inity centerx:(CGFloat)centerx centery:(CGFloat)centery finalx:(CGFloat)finalx finaly:(CGFloat)finaly pointermargin:(NSInteger)pointermargin
{
    if(ttl)
    {
        ttl--;
    }
    else
    {
        ttl = maxttl;
        self.items = [NSMutableArray array];
        BOOL horizontal;
        CGFloat opposite = finaly - inity;
        CGFloat adjacent = finalx - initx;
        
        if(!adjacent)
        {
            adjacent = 1;
        }
        
        CGFloat deltaother;
        CGFloat auxx = initx;
        CGFloat auxy = inity;
        CGFloat deltax = fabs(initx - finalx);
        CGFloat deltay = fabs(inity - finaly);
        CGFloat wavelength = waveshort + interitem;
        CGFloat tanangle;
        NSInteger total;
        NSInteger editorhr = 0;
        NSInteger editorvr = 0;
        
        if(deltay > deltax)
        {
            horizontal = NO;
            tanangle = adjacent / opposite;
            total = deltay / wavelength;
            deltaother = deltax / total;
        }
        else
        {
            horizontal = YES;
            tanangle = opposite / adjacent;
            total = deltax / wavelength;
            deltaother = deltay / total;
        }
        
        if(initx > finalx)
        {
            editorhr = -1;
        }
        else
        {
            editorhr = 1;
        }
        
        if(inity > finaly)
        {
            editorvr = -1;
        }
        else
        {
            editorvr = 1;
        }
        
        CGFloat angle = atan(tanangle);
        
        for(NSInteger i = 0; i < total; i++)
        {
            CGFloat randomwave = arc4random_uniform(maxwavelong) + minwavelong;
            CGFloat randomwave_2 = randomwave / 2.0;
            CGFloat wx = 0;
            CGFloat wy = 0;
            CGFloat wwidth = 0;
            CGFloat wheight = 0;
            BOOL draw = NO;
            
            if(horizontal)
            {
                auxx += waveshort * editorhr;
                auxy += deltaother * editorvr;
                
                if(fabs(auxx - centerx) < pointermargin)
                {
                    draw = NO;
                }
                else
                {
                    draw = YES;
                    wx = -waveshort_2;
                    wy = -randomwave_2;
                    wwidth = waveshort;
                    wheight = randomwave;
                }
            }
            else
            {
                auxx += deltaother * editorhr;
                auxy += waveshort * editorvr;
                
                if(fabs(auxy - centery) < pointermargin)
                {
                    draw = NO;
                }
                else
                {
                    draw = YES;
                    wx = -randomwave_2;
                    wy = -waveshort_2;
                    wwidth = randomwave;
                    wheight = waveshort;
                }
            }
            
            if(draw)
            {
                ggunwaves *wave = [[ggunwaves alloc] init:angle x:wx y:wy width:wwidth height:wheight realx:auxx realy:auxy];
                [self.items addObject:wave];
            }
            
            if(horizontal)
            {
                auxx += interitem * editorhr;
            }
            else
            {
                auxy += interitem * editorvr;
            }
        }
    }
}

-(void)clear
{
    ttl = 0;
    self.items = nil;
}


@end