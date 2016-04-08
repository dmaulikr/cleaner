#import <UIKit/UIKit.h>

@class gtext;

@interface mtextitemglyph:NSObject

-(instancetype)init:(NSString*)character x:(NSInteger)x y:(NSInteger)y size:(CGFloat)size;

@property(strong, nonatomic)gtext *spatial;

@end