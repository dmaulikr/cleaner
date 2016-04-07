#import <UIKit/UIKit.h>
#import "gspatialtexture.h"

@interface ggun:gspatialtexture

-(instancetype)init:(mtextures*)modeltextures;
-(void)initialx:(NSInteger)x y:(NSInteger)y width:(NSInteger)width height:(NSInteger)height;

@property(nonatomic)BOOL active;

@end