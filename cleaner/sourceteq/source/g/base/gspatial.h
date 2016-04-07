#import <UIKit/UIKit.h>
#import "gimage.h"

static GLsizei const vectorcorners = 6;

@interface gspatial:NSObject

-(void)notifiedglkdraw:(NSNotification*)notification;
-(void)vector:(NSUInteger)index x:(NSInteger)x y:(NSInteger)y;
-(void)render;
-(void)movetotop;

@property(strong, nonatomic)NSMutableData *dataposition;
@property(nonatomic)GLKVector2 *pointerposition;
@property(nonatomic)GLKMatrix4 projection;
@property(nonatomic)NSInteger width;
@property(nonatomic)NSInteger height;
@property(nonatomic)NSInteger x;
@property(nonatomic)NSInteger y;

@end