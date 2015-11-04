//
//  MSAddLineModel.h
//  DaBan
//
//  Created by qkm on 15-8-17.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSAddLineModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *adcode;
@property (nonatomic, copy) NSString *district;


@property (nonatomic, copy) NSString *city;//市
@property (nonatomic, copy) NSString *districtCode;//区
@property (nonatomic, copy) NSString *township; //街道
@property (nonatomic, copy) NSString *street;
@property (nonatomic, copy) NSString *number;//门号

@end
