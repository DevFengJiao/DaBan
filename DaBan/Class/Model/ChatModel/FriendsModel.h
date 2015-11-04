//
//  FriendsModel.h
//  NewLingYou
//
//  Created by Seven on 15/6/4.
//  Copyright (c) 2015年 Seven. All rights reserved.
//

#import "MKModel.h"

//userId, userName icon.

/**
 *  个个会话对象的信息,不包括群信息.
    归档时候的信息.
 */
@interface FriendsModel : MKModel<NSCoding>
@property (strong, nonatomic) NSString      *userId; //好友id;//聊天id;
@property (strong, nonatomic) NSString      *userName;//好友昵称.
@property (strong, nonatomic) NSString      *icon;//好友头像
@property (strong, nonatomic) NSString      *email;//好友邮件
@property (strong, nonatomic) NSString      *mobile; //好友手机

@property (strong, nonatomic) NSString      *uid; //id ,本地用户id;
@property (strong, nonatomic) NSString      *loginName;//本地用户有名字
@end
