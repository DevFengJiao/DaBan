//
//  MSChatModel.h
//  DaBan
//
//  Created by qkm on 15-9-9.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MSChatModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *time;         //出发时间
@property (nonatomic, copy) NSString *identf;      //身份
@property (nonatomic, copy) NSString *money;      //起点到终点的费用
@property (nonatomic, copy) NSString *end;       //聊天室的终点地址
@property (nonatomic, copy) NSString *start;      //聊天室的起点地址
@property (nonatomic, copy) NSString *carNumber;  //车主的车牌号
@property (nonatomic, strong) NSArray *headImgs;    //聊天室的头像数组

@property (nonatomic)   int type;
-(instancetype)initWithDictionary:(NSDictionary *)dict;


@end
