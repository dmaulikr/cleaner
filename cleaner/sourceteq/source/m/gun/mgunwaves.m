#import "mgunwaves.h"

static NSInteger const marginwave = 40;
static NSInteger const maxwavelong = 10;
static NSInteger const minwavelong = 1;
static NSInteger const waveshort = 2;
static NSInteger const interitem = 2;
static NSInteger const maxttl = 3;

@implementation mgunwaves
{
    NSInteger wavelength;
    NSInteger waveshort_2;
    NSInteger ttl;
}

-(instancetype)init
{
    self = [super init];
    wavelength = waveshort + interitem;
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
        CGFloat opposite;
        CGFloat adjacent;
        CGFloat deltaother;
        CGFloat auxx;
        CGFloat auxy;
        CGFloat deltax;
        CGFloat deltay;
        CGFloat angle;
        CGFloat wx = 0;
        CGFloat wy = 0;
        CGFloat wwidth = 0;
        CGFloat wheight = 0;
        CGFloat deltaothereditor;
        NSInteger total;
        NSInteger interitemeditor;
        NSInteger waveshorteditor;
        NSInteger editorhr = 0;
        NSInteger editorvr = 0;
        
        if(deltay > deltax)
        {
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
                inity -= marginwave;
                finaly += marginwave;
                
                editorvr = -1;
            }
            else
            {
                inity += marginwave;
                finaly -= marginwave;
                
                editorvr = 1;
            }
            
            opposite = finaly - inity;
            adjacent = finalx - initx;
            auxx = initx;
            auxy = inity;
            deltax = fabs(adjacent);
            deltay = fabs(opposite);
            
            if(!opposite)
            {
                opposite = 1;
            }
            
            horizontal = NO;
            angle = (1 - adjacent) / opposite;
            total = deltay / wavelength;
            deltaother = deltax / total;
            interitemeditor = interitem * editorvr;
            waveshorteditor = waveshort * editorvr;
            deltaothereditor = deltaother * editorhr;
            wy = -waveshort_2;
            wheight = waveshort;
        }
        else
        {
            if(initx > finalx)
            {
                initx -= marginwave;
                finalx += marginwave;
                
                editorhr = -1;
            }
            else
            {
                initx += marginwave;
                finalx -= marginwave;
                
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
            
            opposite = finaly - inity;
            adjacent = finalx - initx;
            auxx = initx;
            auxy = inity;
            deltax = fabs(adjacent);
            deltay = fabs(opposite);
            
            if(!adjacent)
            {
                adjacent = 1;
            }
            
            horizontal = YES;
            angle = (1 + opposite) / adjacent;
            total = deltax / wavelength;
            deltaother = deltay / total;
            interitemeditor = interitem * editorhr;
            waveshorteditor = waveshort * editorhr;
            deltaothereditor = deltaother * editorvr;
            wx = -waveshort_2;
            wwidth = waveshort;
        }
        
        for(NSInteger i = 0; i < total; i++)
        {
            CGFloat randomwave_2 = arc4random_uniform(maxwavelong) + minwavelong;
            CGFloat randomwave = randomwave_2 + randomwave_2;
            BOOL draw = NO;
            
            if(horizontal)
            {
                auxx += waveshorteditor;
                auxy += deltaothereditor;
                
                if(fabs(auxx - centerx) < pointermargin)
                {
                    draw = NO;
                }
                else
                {
                    draw = YES;
                    wy = -randomwave_2;
                    wheight = randomwave;
                }
            }
            else
            {
                auxx += deltaothereditor;
                auxy += waveshorteditor;
                
                if(fabs(auxy - centery) < pointermargin)
                {
                    draw = NO;
                }
                else
                {
                    draw = YES;
                    wx = -randomwave_2;
                    wwidth = randomwave;
                }
            }
            
            if(draw)
            {
                ggunwaves *wave = [[ggunwaves alloc] init:angle x:wx y:wy width:wwidth height:wheight realx:auxx realy:auxy];
                [self.items addObject:wave];
            }
            
            if(horizontal)
            {
                auxx += interitemeditor;
            }
            else
            {
                auxy += interitemeditor;
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