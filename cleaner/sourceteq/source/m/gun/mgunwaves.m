#import "mgunwaves.h"

static NSInteger const maxwavelong = 10;
static NSInteger const minwavelong = 1;
static NSInteger const waveshort = 2;
static NSInteger const interitem = 2;
static NSInteger const wavemargin = 12;

@implementation mgunwaves
{
    NSMutableArray<ggunwaves*> *items;
    NSMutableArray<NSNumber*> *wavelengths;
    NSInteger wavelength;
    NSInteger waveshort_2;
}

-(instancetype)init
{
    self = [super init];
    wavelength = waveshort + interitem;
    waveshort_2 = waveshort / 2;
    wavelengths = [NSMutableArray array];
    
    return self;
}

#pragma mark public

-(void)restart:(NSInteger)initx inity:(NSInteger)inity centerx:(NSInteger)centerx centery:(NSInteger)centery finalx:(NSInteger)finalx finaly:(NSInteger)finaly pointermargin:(NSInteger)pointermargin
{
    items = [NSMutableArray array];
    BOOL horizontal;
    CGFloat opposite = finaly - inity;
    CGFloat adjacent = finalx - initx;
    CGFloat deltaother;
    CGFloat auxx = initx;
    CGFloat auxy = inity;
    CGFloat deltax = fabs(adjacent);
    CGFloat deltay = fabs(opposite);
    CGFloat angle;
    CGFloat wx = 0;
    CGFloat wy = 0;
    CGFloat wwidth = 0;
    CGFloat wheight = 0;
    CGFloat deltaothereditor;
    NSInteger total;
    NSInteger total_margin;
    NSInteger editorhr = 0;
    NSInteger editorvr = 0;
    NSInteger interitemeditor;
    NSInteger waveshorteditor;
    
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
    
    if(deltay > deltax)
    {
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
    
    total_margin = total - wavemargin;
    
    if(horizontal)
    {
        for(NSInteger i = 0; i < total_margin; i++)
        {
            auxx += waveshorteditor;
            auxy += deltaothereditor;
            
            if(i > wavemargin)
            {
                if(fabs(auxx - centerx) > pointermargin)
                {
                    CGFloat randomwave_2 = arc4random_uniform(maxwavelong) + minwavelong;
                    CGFloat randomwave = randomwave_2 + randomwave_2;
                    wy = -randomwave_2;
                    wheight = randomwave;
                    
                    ggunwaves *wave = [[ggunwaves alloc] init:angle x:wx y:wy width:wwidth height:wheight realx:auxx realy:auxy];
                    [items addObject:wave];
                }
            }
            
            auxx += interitemeditor;
        }
    }
    else
    {
        for(NSInteger i = 0; i < total_margin; i++)
        {
            auxx += deltaothereditor;
            auxy += waveshorteditor;
            
            if(i > wavemargin)
            {
                if(fabs(auxy - centery) > pointermargin)
                {
                    NSInteger randomwave_2 = arc4random_uniform(maxwavelong) + minwavelong;
                    NSInteger randomwave = randomwave_2 + randomwave_2;
                    wx = -randomwave_2;
                    wwidth = randomwave;
                    
                    ggunwaves *wave = [[ggunwaves alloc] init:angle x:wx y:wy width:wwidth height:wheight realx:auxx realy:auxy];
                    [items addObject:wave];
                }
            }
            
            auxy += interitemeditor;
        }
    }
}

-(void)clear
{
    items = nil;
}

@end