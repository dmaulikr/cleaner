#import "appdel.h"

@class mfoe;
@class mfoeitem;

@interface sfoe:NSObject

-(instancetype)init:(mfoe*)model;
-(mfoeitem*)foe;

@property(weak, nonatomic)mfoe *model;

@end