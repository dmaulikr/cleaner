#import "appdel.h"

@class mtextures;
@class mtextitem;

@interface mtext:NSObject

-(instancetype)init:(mtextures*)modeltextures;
-(void)addscoretext:(NSString*)text x:(NSInteger)x y:(NSInteger)y;
-(mtextitem*)addtotalscore:(NSString*)text x:(NSInteger)x y:(NSInteger)y;

@property(weak, nonatomic)mtextures *modeltextures;
@property(strong, nonatomic)NSMutableArray<mtextitem*> *items;

@end