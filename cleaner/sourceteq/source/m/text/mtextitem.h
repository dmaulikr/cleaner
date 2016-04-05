#import "appdel.h"

@class mtextitemglyph;

@interface mtextitem:NSObject

@property(strong, nonatomic)NSMutableArray<mtextitemglyph*> *glyphs;

@end