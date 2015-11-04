//
//  MSComModel.m
//  DaBan
//
//  Created by qkm on 15-8-4.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSComModel.h"

static MSComModel *shareCom = nil;

@implementation MSComModel


+(MSComModel *)shareComModel{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareCom  = [[self alloc]init];
    });
    
    return shareCom;
}

+(id)allocWithZone:(struct _NSZone *)zone{
    @synchronized(self){
        if (!shareCom) {
            shareCom = [super allocWithZone:zone];
        }
    
    }
    return shareCom;
}

- (id) copyWithZone:(struct _NSZone *)zone
{
    return shareCom;
}

@end
