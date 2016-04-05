#import <UIKit/UIKit.h>

@class mtext;
@class mtextitemglyph;

@interface mtextitem:NSObject

-(instancetype)init:(mtext*)model;
-(instancetype)init:(mtext*)model ttl:(NSInteger)ttl;

@property(weak, nonatomic)mtext *model;
@property(strong, nonatomic)NSMutableArray<mtextitemglyph*> *glyphs;
@property(nonatomic)NSInteger ttl;

@end