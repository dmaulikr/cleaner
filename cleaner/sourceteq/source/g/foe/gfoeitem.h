#import <Foundation/Foundation.h>
#import "gspatialtexture.h"

@class mfoeitem;
@class gfoeshadow;

@interface gfoeitem:gspatialtexture

-(instancetype)init:(mfoeitem*)model;

@property(weak, nonatomic)mfoeitem *model;
@property(strong, nonatomic)gfoeshadow *shadow;

@end