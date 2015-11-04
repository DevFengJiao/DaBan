//
//  MSChatCarView.m
//  DaBan
//
//  Created by qkm on 15-9-11.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSChatCarView.h"

@implementation MSChatCarView

-(id)init{
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    UIImageView *bgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 226)];
    bgV.backgroundColor = [UIColor clearColor];
    bgV.userInteractionEnabled = YES;
    bgV.image = [UIImage imageNamed:@"my_bgImgV.png"];
    [self addSubview:bgV];
    
    self.myHeadImageView = [[EGOImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-35,50, 70, 70)];
    self.myHeadImageView.backgroundColor = [UIColor clearColor];
    self.myHeadImageView.layer.cornerRadius = CGRectGetHeight([self.myHeadImageView bounds])/2;
    self.myHeadImageView.clipsToBounds = YES;
    self.myHeadImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.myHeadImageView.userInteractionEnabled = YES;
    [bgV addSubview:self.myHeadImageView];
    
    
    self.sexImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2+20, CGRectGetMaxY(self.myHeadImageView.frame)-20, 15, 15)];
    self.sexImageView.backgroundColor = [UIColor clearColor];
    [bgV addSubview:self.sexImageView];
    
    self.myName = [[UILabel alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.myHeadImageView.frame)+10, SCREEN_WIDTH, 20)];
    self.myName.backgroundColor = [UIColor clearColor];
    self.myName.textColor = ZICOLOR;
    self.myName.textAlignment = NSTextAlignmentCenter;
    self.myName.font = [UIFont systemFontOfSize:17];
    [bgV addSubview:self.myName];
    
    UILabel *zilab = [[UILabel alloc]initWithFrame:CGRectMake(0, 226-11-12, SCREEN_WIDTH, 12)];
    zilab.backgroundColor = [UIColor clearColor];
    zilab.text = @"搭伴拼车 快乐同行";
    zilab.textColor = ZIGRAY;
    zilab.textAlignment = NSTextAlignmentCenter;
    zilab.font = ZIFOUT12;
    [bgV addSubview:zilab];
    
}
-(void)setModel:(MSUserModel *)model{
    _model = model;
    self.myName.text      = model.name;
    self.myHeadImageView.imageURL = [NSURL URLWithString:model.headImgUrl];
    if (model.sex == 1) {
        self.sexImageView.image = [UIImage imageNamed:@"my_man"];
    }else if(model.sex == 2){
        self.sexImageView.image = [UIImage imageNamed:@"my_woman"];
    }
}


@end
