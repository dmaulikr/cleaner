#import "appdel.h"

@class mtext;
@class mtextitemglyph;

@interface mtextitem:NSObject

+(instancetype)numbers:(mtext*)model text:(NSString*)text x:(NSInteger)x y:(NSInteger)y ttl:(NSInteger)ttl;

@property(weak, nonatomic)mtext *model;
@property(strong, nonatomic)NSMutableArray<mtextitemglyph*> *glyphs;
@property(nonatomic)NSInteger ttl;

@end