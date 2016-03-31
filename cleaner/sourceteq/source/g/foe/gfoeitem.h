#import <Foundation/Foundation.h>
#import "gspatialtexture.h"

@class mfoeitem;

@interface gfoeitem:gspatialtexture

-(instancetype)init:(mfoeitem*)model;

@property(weak, nonatomic)mfoeitem *model;

@end