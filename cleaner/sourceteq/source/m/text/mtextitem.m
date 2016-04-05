#import "mtextitem.h"

@implementation mtextitem

+(instancetype)numbers:(NSString*)text x:(NSInteger)x y:(NSInteger)y
{
    mtextitem *item = [[mtextitem alloc] init];
    NSUInteger count = text.length;
    NSInteger sumx = x;
    
    for(NSInteger i = 0; i < count; i++)
    {
        NSRange range = NSMakeRange(i, 1);
        NSString *c = [text substringWithRange:range];
        NSUInteger number = c.integerValue;
        mtextitemglyphnumber *model = [mtextitemglyphnumber number:number x:x y:y];
        sumx += model.width;
        [item.glyphs addObject:model];
    }
    
    return item;
}

-(instancetype)init
{
    self = [super init];
    self.glyphs = [NSMutableArray array];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end