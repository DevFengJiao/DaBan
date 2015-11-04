//
//  MSActivityDetailView.m
//  DaBan
//
//  Created by qkm on 15-8-24.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSActivityDetailView.h"

@implementation MSActivityDetailView

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
    
    _collectBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-60, 22, 40, 40)];
    _collectBtn.backgroundColor = [UIColor clearColor];
    [self addSubview:_collectBtn];
    
    _shareBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_collectBtn.frame)+40, 22, 40, 40)];
    _shareBtn.backgroundColor = [UIColor clearColor];
    [_shareBtn setImage:[UIImage imageNamed:@"01-3分享"] forState:UIControlStateNormal];
    [self addSubview:_shareBtn];
    
    
    _titleLab = [[UILabel alloc]init];
    _titleLab.frame = CGRectMake(10, CGRectGetMaxY(_shareBtn.frame)+22, SCREEN_WIDTH-40, 18);
    _titleLab.backgroundColor = [UIColor clearColor];
    _titleLab.font = [UIFont systemFontOfSize:18];
    _titleLab.textColor = APP_COLOR;
    [self addSubview:_titleLab];
    
    UIImageView *addrIV = [[UIImageView alloc]initWithFrame:CGRectMake(10+2, CGRectGetMaxY(_titleLab.frame)+15, 11, 15)];
    addrIV.backgroundColor = [UIColor clearColor];
    addrIV.image = [UIImage  imageNamed:@"01-3位置"];
    [self addSubview:addrIV];
    
    _addrLab = [[UILabel alloc] init];
    _addrLab.frame = CGRectMake(CGRectGetMaxX(addrIV.frame)+3.33+2, CGRectGetMaxY(_titleLab.frame)+15, SCREEN_WIDTH-70, 15);
    _addrLab.backgroundColor = [UIColor clearColor];
     _addrLab.font = [UIFont systemFontOfSize:12];
    _addrLab.textColor = ZIGRAY;
    _addrLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_addrLab];
    
    UIImageView *timeIV = [[UIImageView alloc]initWithFrame:CGRectMake(11, CGRectGetMaxY(_addrLab.frame)+10, 13, 13)];
    timeIV.backgroundColor = [UIColor clearColor];
    timeIV.image = [UIImage  imageNamed:@"activity_time"];
    [self addSubview:timeIV];
    
    _timeLab = [[UILabel alloc] init];
    _timeLab.frame = CGRectMake(CGRectGetMaxX(timeIV.frame)+3.33, CGRectGetMaxY(_addrLab.frame)+10, SCREEN_WIDTH-70, 15);
    _timeLab.backgroundColor = [UIColor clearColor];
    _timeLab.font = [UIFont systemFontOfSize:12];
    _timeLab.textColor = ZIGRAY;
    [self addSubview:_timeLab];
    
    
    UILabel *conLab = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_timeLab.frame)+20, 100, 14)];
    conLab.backgroundColor = [UIColor clearColor];
    conLab.font = [UIFont systemFontOfSize:14];
    conLab.textColor = ZIGRAY;
    conLab.text = @"活动详情";
    [self addSubview:conLab];
    
    
    _conentLab = [[UILabel alloc] init];
    _conentLab.frame = CGRectMake(10, CGRectGetMaxY(conLab.frame)+10, SCREEN_WIDTH-20, 21);
    _conentLab.backgroundColor = [UIColor clearColor];
    _conentLab.textColor = ZIGRAY;
    _conentLab.font = [UIFont systemFontOfSize:14.0f];
    [self addSubview:_conentLab];

//    _nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, self.frame.size.height-40, SCREEN_WIDTH-40, 40)];
//    _nextBtn.backgroundColor = [UIColor blueColor];
//    [_nextBtn setTitle:@"我要参加" forState:UIControlStateNormal];
//    [self addSubview:_nextBtn];
}

-(void)setModel:(MSActivityModel *)model{
    _model = model;
    _titleLab.text = model.title;
    _addrLab.text  = model.addr;
    _timeLab.text  = model.time;
    _conentLab.text = model.conent;
}

@end
