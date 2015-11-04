//
//  GroupInfo.m
//  NewLingYou
//
//  Created by Seven on 15/6/4.
//  Copyright (c) 2015年 Seven. All rights reserved.
//

#import "GroupInfo.h"

@implementation GroupInfo


- (NSString *)description
{
    NSString *description = [NSString stringWithFormat:
                             @"GroupInfo chatGroupId(群聊id):%@,groupName(昵称):%@,groupImgUrl(头像):%@,actiId(行程id):%@ num(群人数):%@",
                             self.chatGroupId,self.groupName,self.groupImgUrl,self.actiId,self.num];
    return description;
    
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_chatGroupId forKey:@"chatGroupId"];
    [aCoder encodeObject:_groupName forKey:@"groupName"];
    [aCoder encodeObject:_groupImgUrl forKey:@"groupImgUrl"];
    [aCoder encodeObject:_actiId forKey:@"actiId"];
    [aCoder encodeObject:_num forKey:@"num"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super init]) {
        _chatGroupId = [aDecoder decodeObjectForKey:@"chatGroupId"];
        _groupName = [aDecoder decodeObjectForKey:@"groupName"];
        _groupImgUrl = [aDecoder decodeObjectForKey:@"groupImgUrl"];
        _actiId = [aDecoder decodeObjectForKey:@"actiId"];
        _num = [aDecoder decodeObjectForKey:@"num"];

    }
    
    return self;
}

@end
