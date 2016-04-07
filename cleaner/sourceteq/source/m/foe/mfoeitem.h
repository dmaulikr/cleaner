#import <UIKit/UIKit.h>

@class gfoe;
@class mfoe;

@interface mfoeitem:NSObject

-(instancetype)init:(mfoe*)model x:(NSInteger)newx;
-(void)spatial:(NSArray<NSNumber*>*)textures width:(NSInteger)newwidth height:(NSInteger)newheight;

@property(strong, nonatomic)gfoe *spatial;
@property(weak, nonatomic)mfoe *model;
@property(nonatomic)NSInteger life;
@property(nonatomic)NSInteger damage;
@property(nonatomic)NSUInteger score;

@end