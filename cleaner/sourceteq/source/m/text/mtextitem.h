#import <UIKit/UIKit.h>

@class mtext;
@class mtextitemglyph;

@interface mtextitem:NSObject

-(instancetype)init:(mtext*)model text:(NSString*)text x:(NSInteger)x y:(NSInteger)y;
-(void)notifiedmove;
-(void)render;
-(mtextitemglyph*)glyphwith:(NSString*)character at:(NSInteger)x;

@property(weak, nonatomic)mtext *model;
@property(strong, nonatomic)NSMutableArray<mtextitemglyph*> *glyphs;
@property(copy, nonatomic)NSString *text;
@property(nonatomic)CGFloat padding;
@property(nonatomic)CGFloat size;
@property(nonatomic)NSInteger ttl;
@property(nonatomic)NSInteger x;
@property(nonatomic)NSInteger y;

@end