#import "mtextitem.h"

@implementation mtextitem

+(instancetype)numbers:(mtext*)model text:(NSString*)text x:(NSInteger)x y:(NSInteger)y ttl:(NSInteger)ttl
{
    mtextitem *item = [[mtextitem alloc] init:model ttl:ttl];
    NSUInteger count = text.length;
    NSInteger sumx = x;
    
    for(NSInteger i = 0; i < count; i++)
    {
        NSRange range = NSMakeRange(i, 1);
        NSString *c = [text substringWithRange:range];
        NSUInteger number = c.integerValue;
        mtextitemglyphnumber *model = [mtextitemglyphnumber number:number x:sumx y:y];
        sumx += model.width;
        [item.glyphs addObject:model];
    }
    
    return item;
}

-(instancetype)init:(mtext*)model ttl:(NSInteger)ttl
{
    self = [super init];
    self.model = model;
    self.ttl = ttl;
    self.glyphs = [NSMutableArray array];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedglkmove:) name:notification_glkmove object:nil];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedglkmove:(NSNotification*)notification
{
    self.ttl--;
    
    if(self.ttl < 1)
    {
        [self.model.items removeObject:self];
    }
}

@end