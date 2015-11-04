//
//  FriendsModel.m
//  NewLingYou
//
//  Created by Seven on 15/6/4.
//  Copyright (c) 2015年 Seven. All rights reserved.
//

#import "FriendsModel.h"

@implementation FriendsModel


- (NSString *)description
{
    NSString *description = [NSString
                             stringWithFormat:
                             @"FriendsModel(聊天id)用户userId:%@,userName(昵称):%@,icon(头像):%@,email(邮件):%@ mobile(手机):%@ uid(本地用户id):%@ loginName(本地用户昵称):%@",self.userId,self.userName,self.icon, self.email, self.mobile,self.uid,self.loginName];
    return description;
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_email forKey:@"email"];
    [aCoder encodeObject:_icon forKey:@"icon"];
    [aCoder encodeObject:_uid forKey:@"uid"];
    [aCoder encodeObject:_loginName forKey:@"loginName"];
    [aCoder encodeObject:_mobile forKey:@"mobile"];
    [aCoder encodeObject:_userId forKey:@"userId"];
    [aCoder encodeObject:_userName forKey:@"userName"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        _email = [aDecoder decodeObjectForKey:@"email"];
        _icon = [aDecoder decodeObjectForKey:@"icon"];
        _uid = [aDecoder decodeObjectForKey:@"uid"];
        _loginName = [aDecoder decodeObjectForKey:@"loginName"];
        _mobile = [aDecoder decodeObjectForKey:@"mobile"];
        _userId = [aDecoder decodeObjectForKey:@"userId"];
        _userName = [aDecoder decodeObjectForKey:@"userName"];
    }
    
    return self;
}
@end
