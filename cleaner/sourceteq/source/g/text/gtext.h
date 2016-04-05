#import "appdel.h"
#import "gspatialtexture.h"

@class mtextitemglyph;

@interface gtext:gspatialtexture

-(instancetype)init:(mtextitemglyph*)model;

@property(nonatomic)CGFloat leftmargin;
@property(nonatomic)CGFloat topmargin;
@property(nonatomic)CGFloat atlaswidth;
@property(nonatomic)CGFloat atlasheight;

@end