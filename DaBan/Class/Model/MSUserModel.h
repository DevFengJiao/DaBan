//
//  MSUserModel.h
//  DaBan
//
//  Created by qkm on 15-8-12.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSUserModel : NSObject
@property (nonatomic, copy) NSString    *myNumber;
@property (nonatomic, copy) NSString    *myComNumber;

@property(nonatomic)       int          uid;
@property(nonatomic, copy) NSString     *phone;
@property(nonatomic, copy) NSString     *name;
@property(nonatomic, copy) NSString     *age;
@property(nonatomic, copy) NSString     *profession;
@property(nonatomic)       int          sex;//性别(1:男 2:女)
@property(nonatomic, copy) NSString     *headImgUrl;//头像（url）
@property(nonatomic, copy) NSString     *carImgUrl;
@property(nonatomic, copy) NSString     *carColor;
@property(nonatomic, copy) NSString     *carStyle;
@property(nonatomic, copy) NSString     *carLicense;//牌照
@property(nonatomic)       int          verifyPhone;//手机认证0(未认证)1(审核中)2(已认证)
@property(nonatomic)       int          verifyId;//身份认证
@property(nonatomic)       int          verifyDriver;//车主认证
@property(nonatomic, copy) NSString     *realName;//真实姓名
@property(nonatomic, copy) NSString     *numId;
@property(nonatomic, copy) NSString     *imgurlId;//身份证存储地址
@property(nonatomic, copy) NSString     *imgurlDriver;//驾驶证存储地址
@property(nonatomic, copy) NSString     *imgurlVehical;//行驶证存储地址

-(instancetype)initWithDictionary:(NSDictionary *)dict;
@end
