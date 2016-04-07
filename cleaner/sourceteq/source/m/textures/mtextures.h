#import "appdel.h"

@interface mtextures:NSObject

+(instancetype)singleton;
-(void)cleartextures;
-(void)loadtextures;

@property(strong, nonatomic)NSArray *textures_areadust;
@property(strong, nonatomic)NSArray *textures_building0;
@property(strong, nonatomic)NSArray *textures_building1;
@property(strong, nonatomic)NSArray *textures_foeinvader;
@property(strong, nonatomic)NSArray *textures_foeocto;
@property(strong, nonatomic)NSArray *textures_gunpointer;
@property(strong, nonatomic)NSArray *textures_guntarget;
@property(strong, nonatomic)NSArray *textures_gunfinger;
@property(strong, nonatomic)NSArray *textures_effectshot;
@property(strong, nonatomic)NSArray *textures_effectsmoke;
@property(strong, nonatomic)NSArray *textures_textnumbers;
@property(strong, nonatomic)NSArray *textures_hublife;

@end