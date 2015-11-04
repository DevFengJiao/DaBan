//
//  MSMyHeadView.m
//  DaBan
//
//  Created by qkm on 15-8-31.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSMyHeadView.h"

@implementation MSMyHeadView
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
    UIImageView *bgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 190)];
    bgV.backgroundColor = [UIColor clearColor];
    bgV.userInteractionEnabled = YES;
    bgV.image = [UIImage imageNamed:@"my_bgImgV.png"];
    [self addSubview:bgV];
    
    self.myHeadImageView = [[EGOImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-35,30, 70, 70)];
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

    UIImageView *bottomIV = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-160,CGRectGetMaxY(self.frame)-38, 150, 28)];
    bottomIV.backgroundColor = ZI_NACOLOR;
    bottomIV.layer.cornerRadius = 14.0;
    bottomIV.clipsToBounds = YES;
    [bgV addSubview:bottomIV];
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(8, 0, 60, 28)];
    label1.backgroundColor = [UIColor clearColor];
    label1.textColor = BACK_GRAY_COLOR;
    label1.text = @"搭伴次数";
    label1.font = [UIFont systemFontOfSize:14];
    [bottomIV addSubview:label1];
    
    self.myNumber = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(label1.frame), 0, 70, 28)];
    self.myNumber.backgroundColor = [UIColor clearColor];
    self.myNumber.textColor = BACK_GRAY_COLOR;
    self.myNumber.font = [UIFont systemFontOfSize:14];
    [bottomIV addSubview:self.myNumber];
    
    UIImageView *comIV = [[UIImageView alloc]initWithFrame:CGRectMake(100, 6.5, 15, 15)];
    comIV.backgroundColor = [UIColor clearColor];
    comIV.image = [UIImage imageNamed:@"my_praise.png"];
    [bottomIV addSubview:comIV];
    
    self.myComNumber = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(comIV.frame)+5, 0, 70, 28)];
    self.myComNumber.backgroundColor = [UIColor clearColor];
    self.myComNumber.textColor = BACK_GRAY_COLOR;
    self.myComNumber.font = [UIFont systemFontOfSize:14];
    [bottomIV addSubview:self.myComNumber];
    
}

-(void)setModel:(MSUserModel *)model{
    _model = model;
//    self.myName.text      = model.name;
    self.myNumber.text    = model.myNumber;
    self.myComNumber.text = model.myComNumber;
    if (model.sex == 1) {
        self.sexImageView.image = [UIImage imageNamed:@"my_man"];
    }else if(model.sex == 2){
        self.sexImageView.image = [UIImage imageNamed:@"my_woman"];
    }
}


@end
