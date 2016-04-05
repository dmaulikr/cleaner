#import "appdel.h"

@class mtextitemglyph;

@interface mtextitem:NSObject

+(instancetype)numbers:(NSString*)text x:(NSInteger)x y:(NSInteger)y;

@property(strong, nonatomic)NSMutableArray<mtextitemglyph*> *glyphs;

@end