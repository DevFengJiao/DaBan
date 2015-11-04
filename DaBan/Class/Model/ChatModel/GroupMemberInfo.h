//
//  GroupMemberInfo.h
//  NewLingYou
//
//  Created by Seven on 15/6/4.
//  Copyright (c) 2015年 Seven. All rights reserved.
//

#import "MKModel.h"

//群成员
//群聊....
@interface GroupMemberInfo : MKModel
@property (strong, nonatomic) NSString      *chatGroupid;
@property (strong, nonatomic) NSString      *openId;//用户微信OPEN ID 也是userId; 如果出错,后台原因.
@property (strong, nonatomic) NSString      *nickName;
@property (strong, nonatomic) NSString      *headImgUrl;
@property (strong, nonatomic) NSString      *timeName;//加团时间;

@end
