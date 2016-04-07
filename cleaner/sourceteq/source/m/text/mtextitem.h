#import <UIKit/UIKit.h>

@class mtext;
@class mtextitemglyph;

@interface mtextitem:NSObject

-(instancetype)init:(mtext*)model text:(NSString*)text x:(NSInteger)x y:(NSInteger)y;
-(void)move;
-(void)render:(NSString*)string x:(NSInteger)x y:(NSInteger)y size:(CGFloat)size padding:(NSInteger)padding;
-(void)starttimer:(NSInteger)newttl;
-(mtextitemglyph*)glyphwith:(NSString*)character at:(NSInteger)x y:(NSInteger)y size:(CGFloat)size;
-(void)remove;

@property(weak, nonatomic)mtext *model;
@property(strong, nonatomic)NSMutableArray<mtextitemglyph*> *glyphs;
@property(nonatomic)Class glyphclass;

@end