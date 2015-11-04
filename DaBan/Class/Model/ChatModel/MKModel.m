//
//  MKModel.m
//  NewLingYou
//
//  Created by Seven on 15/6/2.
//  Copyright (c) 2015年 Seven. All rights reserved.
//

#import "MKModel.h"

@implementation MKModel
//处理特殊key
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
   
    if ([key isEqualToString:@"id"]) {
        
        [self setValue:value forKey:@"uid"];
    }
    else
    {
         NSLog(@"------------ MKModel: key:%@没有定义 ----------------",key);
    }
}
@end
