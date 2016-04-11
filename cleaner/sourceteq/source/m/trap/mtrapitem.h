#import <UIKit/UIKit.h>

@class mtrap;

@interface mtrapitem:NSObject

-(instancetype)init:(mtrap*)model x:(NSInteger)newx;
-(void)spatial:(NSArray<NSNumber*>*)textures;

@property(weak, nonatomic)mtrap *model;
@property(nonatomic)NSInteger damage;

@end