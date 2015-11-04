//
//  MSCarModel.h
//  DaBan
//
//  Created by qkm on 15-8-8.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSCarModel : NSObject
@property (nonatomic, copy)NSString     *title;
@property (nonatomic, copy)NSString     *arce;
@property (nonatomic, copy)NSString     *searchName;


-(instancetype)initWithDictionary:(NSDictionary *) dict;


+ (NSArray *)types;
+ (UIImage *)imageOfType:(NSString *)type;

+ (NSArray *)subtypesOfType:(NSString *)type;

+ (NSArray *)colorNames;
+ (UIImage *)imageOfColorName:(NSString *)colorName;
//地图车主详情属性
@property (nonatomic, copy) NSString *carNumber;
@property (nonatomic, copy) NSString *carName;
@property (nonatomic, copy) NSString *carModels;
@property (nonatomic, copy) NSString *carColor;
@property (nonatomic, copy) NSString *handImg;
@property (nonatomic, copy) NSString *people;
@property (nonatomic, copy) NSString *com;
@property(nonatomic)       int          sex;//性别(1:男 2:女)
//

@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *subtype;
@property (nonatomic, copy) NSString *colorName;
@property (nonatomic, assign) NSInteger numberOfSeat;

- (UIImage *)typeImage;
- (UIImage *)colorImage;

@end
