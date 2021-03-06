//
//  MSWalletModel.h
//  DaBan
//
//  Created by qkm on 15-8-19.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSWalletModel : NSObject
@property (nonatomic, copy) NSString *bgImg;
@property (nonatomic, copy) NSString *ziStr;
@property (nonatomic, copy) NSString *wallet;
@property (nonatomic, copy) NSString *payment; //付款

@property (nonatomic, copy) NSString *cellImg;
@property (nonatomic, copy) NSString *cellTitle;

//身份认证的信息
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *number;
@property (nonatomic, copy) NSString *identfImg;

@property (nonatomic, copy) NSString *identfState;//身份认证状态


//交易明细
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *priceCon;
@property (nonatomic, copy) NSString *priceTime;
@end
