#import <UIKit/UIKit.h>

@class gtext;
@class mtextures;
@class gspatialtexture;

@interface mtextitemglyph:NSObject

-(instancetype)init:(NSString*)character x:(NSInteger)x y:(NSInteger)y size:(CGFloat)size;

@property(strong, nonatomic)gtext *spatial;
@property(weak, nonatomic)mtextures *modeltextures;
@property(copy, nonatomic)NSString *assetname;
@property(nonatomic)CGFloat atlaswidth;
@property(nonatomic)CGFloat atlasheight;
@property(nonatomic)CGFloat leftmargin;
@property(nonatomic)CGFloat topmargin;
@property(nonatomic)CGFloat width;
@property(nonatomic)NSInteger height;
@property(nonatomic)NSInteger x;
@property(nonatomic)NSInteger y;

@end