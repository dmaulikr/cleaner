#import "appdel.h"

@interface mtextures:NSObject

+(instancetype)singleton;
-(void)cleartextures;
-(void)loadtextures;

@property(strong, nonatomic)NSArray *textures_areadust;
@property(strong, nonatomic)NSArray *textures_buildingalpha;
@property(strong, nonatomic)NSArray *textures_buildingbeta;
@property(strong, nonatomic)NSArray *textures_foeinvader;
@property(strong, nonatomic)NSArray *textures_foeocto;
@property(strong, nonatomic)NSArray *textures_gunpointer;
@property(strong, nonatomic)NSArray *textures_guntarget;
@property(strong, nonatomic)NSArray *textures_gunfinger;
@property(strong, nonatomic)NSArray *textures_effectshot;
@property(strong, nonatomic)NSArray *textures_effectsmoke;
@property(strong, nonatomic)NSArray *textures_effectcrown;
@property(strong, nonatomic)NSArray *textures_effectbombing;
@property(strong, nonatomic)NSArray *textures_hublife;
@property(strong, nonatomic)NSArray *textures_text0;
@property(strong, nonatomic)NSArray *textures_text1;
@property(strong, nonatomic)NSArray *textures_text2;
@property(strong, nonatomic)NSArray *textures_text3;
@property(strong, nonatomic)NSArray *textures_text4;
@property(strong, nonatomic)NSArray *textures_text5;
@property(strong, nonatomic)NSArray *textures_text6;
@property(strong, nonatomic)NSArray *textures_text7;
@property(strong, nonatomic)NSArray *textures_text8;
@property(strong, nonatomic)NSArray *textures_text9;
@property(strong, nonatomic)NSArray *textures_trapbomb;

@end