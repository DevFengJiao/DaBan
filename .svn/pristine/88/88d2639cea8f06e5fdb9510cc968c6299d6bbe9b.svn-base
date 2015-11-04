//
//  MSReserveView.m
//  DaBan
//
//  Created by qkm on 15-8-27.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSReserveView.h"
#import "MSMyHeadView.h"


@implementation MSReserveView

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
    self.backgroundColor = [UIColor whiteColor];
    
    _bgImgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 119)];
    _bgImgV.backgroundColor = [UIColor clearColor];
    _bgImgV.userInteractionEnabled = YES;
    _bgImgV.image = [UIImage imageNamed:@"my_bgImgV.png"];
    [self addSubview:_bgImgV];
    
    self.myHeadImageView = [[EGOImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-35, 10, 70, 70)];
    self.myHeadImageView.backgroundColor = [UIColor clearColor];
    self.myHeadImageView.layer.cornerRadius = CGRectGetHeight([self.myHeadImageView bounds])/2;
    self.myHeadImageView.clipsToBounds = YES;
    self.myHeadImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.myHeadImageView.userInteractionEnabled = YES;
    [_bgImgV addSubview:self.myHeadImageView];
    
    
    self.sexImageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2+20, CGRectGetMaxY(self.myHeadImageView.frame)-20, 15, 15)];
    self.sexImageView.backgroundColor = [UIColor clearColor];
    [_bgImgV addSubview:self.sexImageView];
    
    self.myName = [[UILabel alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.myHeadImageView.frame)+10, SCREEN_WIDTH, 20)];
    self.myName.backgroundColor = [UIColor clearColor];
    self.myName.textColor = ZICOLOR;
    self.myName.textAlignment = NSTextAlignmentCenter;
    self.myName.font = [UIFont systemFontOfSize:17];
    [_bgImgV addSubview:self.myName];

    UIImageView *timeIV = [[UIImageView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_bgImgV.frame)+15, 15, 15)];
    timeIV.image = [UIImage imageNamed:@"activity_time"];
    timeIV.backgroundColor = [UIColor clearColor];
    [self addSubview:timeIV];
    
    self.timeLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(timeIV.frame)+3, CGRectGetMaxY(_bgImgV.frame)+16.5, 250, 12)];
    self.timeLab.backgroundColor = [UIColor clearColor];
    self.timeLab.textColor = ZIGRAY;
    self.timeLab.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.timeLab];
    
    UIImageView *rangeIV = [[UIImageView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(timeIV.frame)+12.5, 15, 10)];
    rangeIV.backgroundColor = [UIColor clearColor];
    rangeIV.image = [UIImage imageNamed:@"activity_range"];
    [self addSubview:rangeIV];
    
    self.rangeLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(rangeIV.frame)+3, CGRectGetMaxY(self.timeLab.frame)+14, 250, 12)];
    self.rangeLab.backgroundColor = [UIColor clearColor];
    self.rangeLab.textColor = ZIGRAY;
    self.rangeLab.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.rangeLab];
    
    UIImageView *linIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_bgImgV.frame)+62, SCREEN_WIDTH, 10)];
    linIV.backgroundColor = LINEE;
    [self addSubview:linIV];
    
    
    self.priceBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(linIV.frame), SCREEN_WIDTH, CELLHEIGHT)];
    self.priceBtn.tag = 1;
    self.priceBtn.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.priceBtn];
    
    UIImageView *priceIV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 17.5, 20, 20)];
    priceIV.backgroundColor = [UIColor clearColor];
    priceIV.image  = [UIImage imageNamed:@"activity_price"];
    [self.priceBtn addSubview:priceIV];
    
    UILabel *pciceLab2 = [[UILabel alloc]initWithFrame:CGRectMake(10+20+6, 0, 70, self.priceBtn.frame.size.height)];
    pciceLab2.backgroundColor = [UIColor clearColor];
    pciceLab2.text = @"平摊费用";
    pciceLab2.textColor = ZIGRAY;
    pciceLab2.font = [UIFont systemFontOfSize:14];
    [self.priceBtn addSubview:pciceLab2];
    
    self.pciceLab = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-100, 0, 90, self.priceBtn.frame.size.height)];
    self.pciceLab.backgroundColor = [UIColor clearColor];
    self.pciceLab.textColor = [UIColor colorFromHexString:@"0xf56b58"];
    self.pciceLab.font = [UIFont systemFontOfSize:14];
    self.pciceLab.textAlignment = NSTextAlignmentRight;
    [self.priceBtn addSubview:self.pciceLab];
    
    UILabel *line3 = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.priceBtn.frame), SCREEN_WIDTH, 0.5)];
    line3.backgroundColor = LINEC;
    [self addSubview:line3];
    
    self.payBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(line3.frame), SCREEN_WIDTH, CELLHEIGHT)];
    self.payBtn.tag = 2;
    self.payBtn.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.payBtn];
    
    UIImageView *payIV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 17.5, 20, 20)];
    payIV.backgroundColor = [UIColor clearColor];
    payIV.image  = [UIImage imageNamed:@"activity_price"];
    [self.payBtn addSubview:payIV];
    
    UILabel *payLab = [[UILabel alloc]initWithFrame:CGRectMake(10+20+6, 0, 70, self.priceBtn.frame.size.height)];
    payLab.backgroundColor = [UIColor clearColor];
    payLab.text = @"支付";
    payLab.textColor = ZIGRAY;
    payLab.font = [UIFont systemFontOfSize:14];
    [self.payBtn addSubview:payLab];
    
    self.payLab2 = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-122, 0, 90, self.priceBtn.frame.size.height)];
    self.payLab2.backgroundColor = [UIColor clearColor];
    self.payLab2.textColor = ZIGRAY;
    self.payLab2.font = [UIFont systemFontOfSize:12];
    [self.payBtn addSubview:self.payLab2];

    

    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-22, (CELLHEIGHT-15)/2, 10, 15)];
    iv.backgroundColor = [UIColor clearColor];
    iv.image = [UIImage imageNamed:@"arrow-r"];
    [self.payBtn addSubview:iv];
    
    UILabel *blowLab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.payBtn.frame), SCREEN_WIDTH, 200)];
    blowLab.backgroundColor = LINEE;
    [self addSubview:blowLab];
    
}

-(void)setModel:(MSActivityModel *)model{
    _model = model;
    self.myName.text   = model.carName;
    self.timeLab.text   = model.time;
    self.rangeLab.text  = model.range;
    self.payLab2.text   = model.pay;
    self.pciceLab.text  = [NSString stringWithFormat:@"%@元",model.pcice];
    self.myHeadImageView.imageURL   = [NSURL URLWithString:model.image];
}

@end
