#import "mtextitem.h"
#import "appdel.h"

@implementation mtextitem

-(instancetype)init:(mtext*)model text:(NSString*)text x:(NSInteger)x y:(NSInteger)y
{
    self = [super init];
    self.model = model;
    self.text = text;
    self.x = x;
    self.y = y;
    self.glyphs = [NSMutableArray array];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedglkmove:(NSNotification*)notification
{
    [self notifiedmove];
}

#pragma mark public

-(void)notifiedmove
{
    self.ttl--;
    
    if(self.ttl < 1)
    {
        [self.model.items removeObject:self];
    }
}

-(void)render
{
    NSUInteger count = self.text.length;
    NSInteger sumx = self.x;
    
    for(NSInteger i = 0; i < count; i++)
    {
        NSRange range = NSMakeRange(i, 1);
        NSString *c = [self.text substringWithRange:range];
        NSUInteger number = c.integerValue;
        mtextitemglyphnumber *model = [mtextitemglyphnumber number:number x:sumx y:self.y size:self.size];
        sumx += model.width + self.padding;
        [self.glyphs addObject:model];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
}

@end