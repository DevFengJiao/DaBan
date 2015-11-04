//
//  MSThird.m
//  DaBan
//
//  Created by qkm on 15-8-8.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSThird.h"

@implementation MSThird

- (NSString *)decodeFromPercentEscapeString: (NSString *) input
{
    NSMutableString *outputStr = [NSMutableString stringWithString:input];
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@""
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0,
                                                      [outputStr length])];
    
    return
    [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
}




+ (NSString *)formatSpecialJsonString:(NSString *)jsonStr {
    if (!jsonStr) {
        return nil;
    }
    
    
    if ([jsonStr hasPrefix:@"\""]) {
        NSMutableString *result = [NSMutableString stringWithString:jsonStr];
        NSRange range = NSMakeRange(0, [result length]);
        [result replaceOccurrencesOfString:@"\\\"" withString:@"\"" options:NSCaseInsensitiveSearch range:range];
        
        return [result substringWithRange:NSMakeRange(1, [result length] - 2)];
    } else {
        return jsonStr;
    }
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

@end
