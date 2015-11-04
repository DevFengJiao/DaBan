//
//  MSHeadView.m
//  DaBan
//
//  Created by qkm on 15-8-5.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSHeadView.h"
#import "Colours.h"

@implementation MSHeadView

-(id)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
    
}
-(void)setUp
{
    
    _headImgV = [[EGOImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-35, 10, 70, 70)];
    _headImgV.backgroundColor = [UIColor clearColor];
    _headImgV.contentMode = UIViewContentModeScaleAspectFill;
    _headImgV.layer.cornerRadius =CGRectGetHeight([_headImgV bounds]) / 2;
    _headImgV.clipsToBounds = YES;
    _headImgV.image = [UIImage imageNamed:@"picture-noLog@2x"];
    [self addSubview:_headImgV];
    
    self.sexImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2+20, CGRectGetMaxY(_headImgV.frame)-20, 15, 15)];
    self.sexImageView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.sexImageView];

    
    _headLabel = [[UILabel alloc] init];
    _headLabel.frame = CGRectMake(0, CGRectGetMaxY(_headImgV.frame)+10, SCREEN_WIDTH, 20);
    _headLabel.backgroundColor = [UIColor clearColor];
    _headLabel.textColor = ZICOLOR;
    _headLabel.textAlignment = NSTextAlignmentCenter;
    _headLabel.font = [UIFont systemFontOfSize:17.0];
    _headLabel.text = @"更换头像";
    [self addSubview:_headLabel];
    
}


-(void)setModel:(MSUserModel *)model
{
    _model = model;
    _headImgV.image = [UIImage imageWithContentsOfFile:model.headImgUrl];
    if (model.sex == 1) {
        self.sexImageView.image = [UIImage imageNamed:@"my_man"];
    }else if(model.sex == 2){
        self.sexImageView.image = [UIImage imageNamed:@"my_woman"];
    }
}



@end
