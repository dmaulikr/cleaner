#import "mtextitem.h"
#import "appdel.h"

@implementation mtextitem
{
    NSInteger ttl;
}

-(instancetype)init:(mtext*)model text:(NSString*)text x:(NSInteger)x y:(NSInteger)y
{
    self = [super init];
    self.model = model;
    self.glyphs = [NSMutableArray array];
    self.glyphclass = [mtextitemglyph class];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark public

-(void)move
{
    ttl--;
    
    if(ttl < 1)
    {
        [self remove];
    }
}

-(void)render:(NSString*)string x:(NSInteger)x y:(NSInteger)y size:(CGFloat)size padding:(NSInteger)padding
{
    NSUInteger count = string.length;
    NSInteger sumx = x;
    
    for(NSInteger i = 0; i < count; i++)
    {
        NSRange range = NSMakeRange(i, 1);
        NSString *character = [string substringWithRange:range];
        mtextitemglyph *model = [self glyphwith:character at:sumx y:y size:size];
        sumx += model.spatial.width + padding;
        
        [self.glyphs addObject:model];
    }
}

-(void)starttimer:(NSInteger)newttl
{
    ttl = newttl;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(move) name:notification_glkmove object:nil];
}

-(mtextitemglyph*)glyphwith:(NSString*)character at:(NSInteger)x y:(NSInteger)y size:(CGFloat)size
{
    mtextitemglyph *glyph = [[self.glyphclass alloc] init:character x:x y:y size:size];
    
    return glyph;
}

-(void)remove
{
    [self.model.items removeObject:self];
}

@end