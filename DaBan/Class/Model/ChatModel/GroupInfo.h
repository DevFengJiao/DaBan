//
//  GroupInfo.h
//  NewLingYou
//
//  Created by Seven on 15/6/4.
//  Copyright (c) 2015年 Seven. All rights reserved.
//

#import "MKModel.h"
#import "GroupMemberInfo.h"
@interface GroupInfo : MKModel<NSCoding>
@property (strong, nonatomic) NSString  *chatGroupId; //群聊id;
@property (strong, nonatomic) NSString  *groupName;//群昵称
@property (strong, nonatomic) NSString  *groupImgUrl;//群头像.
@property (strong, nonatomic) NSString  *actiId; //行程id;
@property (strong, nonatomic) NSString  *num;//人数
@property (strong, nonatomic) NSString  *startTime;//开团时间.

@end
