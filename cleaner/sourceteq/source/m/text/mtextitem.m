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
        NSString *character = [self.text substringWithRange:range];
        mtextitemglyph *model = [self glyphwith:character at:sumx];
        sumx += model.width + self.padding;
        
        [self.glyphs addObject:model];
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
}

-(mtextitemglyph*)glyphwith:(NSString*)character at:(NSInteger)x
{
    mtextitemglyph *glyph = [[mtextitemglyph alloc] init:character x:x y:self.y size:self.size];
    
    return glyph;
}

@end