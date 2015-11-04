//
//  MSChatHeadView.m
//  DaBan
//
//  Created by qkm on 15-9-15.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSChatHeadView.h"

@implementation MSChatHeadView
-(id)init{
    self = [super init];
    if (self) {
//        [self initUI];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        [self initUI];
    }
    return self;
}

-(void)initUI{

    self.type = self.model.type;
    
    UIImageView *stardEndImagV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 5, 23)];
    stardEndImagV.backgroundColor = [UIColor clearColor];
    stardEndImagV.image = [UIImage imageNamed:@"chat_start_end"];
    stardEndImagV.userInteractionEnabled = YES;
    [self addSubview:stardEndImagV];
    
    self.startLab = [[UILabel alloc]initWithFrame:CGRectMake(4+CGRectGetMaxX(stardEndImagV.frame), 10, 180, 12)];
    self.startLab.backgroundColor = [UIColor clearColor];
    self.startLab.font = ZIFOUT12;
    self.startLab.textColor = ZICOLOR;
    [self addSubview:self.startLab];
    
    self.endLab = [[UILabel alloc]initWithFrame:CGRectMake(4+CGRectGetMaxX(stardEndImagV.frame), 9+CGRectGetMaxY(self.startLab.frame), 180, 12)];
    self.endLab.backgroundColor = [UIColor clearColor];
    self.endLab.font = ZIFOUT12;
    self.endLab.textColor = ZICOLOR;
    [self addSubview:self.endLab];
    
    UIImageView *timeImgV = [[UIImageView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.endLab.frame)+10, 12, 12)];
    timeImgV.backgroundColor = [UIColor clearColor];
    timeImgV.image = [UIImage imageNamed:@"chat_time"];
    [self addSubview:timeImgV];
    
    self.timeLab = [[UILabel alloc]initWithFrame:CGRectMake(4+CGRectGetMaxX(timeImgV.frame), 10+CGRectGetMaxY(self.endLab.frame), 70, 12)];
    self.timeLab.backgroundColor = [UIColor clearColor];
    self.timeLab.font = [UIFont systemFontOfSize:10];
    self.timeLab.textColor = LINE9;
    [self addSubview:self.timeLab];
    
    carModelVew = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    
    if (self.type == 2) {
        carModelVew.frame = CGRectMake(10+CGRectGetMaxX(self.timeLab.frame), 10+CGRectGetMaxY(self.endLab.frame), 80, 12);
        UIImageView *carIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 12, 12)];
        carIV.backgroundColor = [UIColor clearColor];
        carIV.image = [UIImage imageNamed:@"chat_time"];
        [carModelVew addSubview:carIV];
        
        self.carNumberLab = [[UILabel alloc]initWithFrame:CGRectMake(17, 0,63, 12)];
        self.carNumberLab .backgroundColor = [UIColor clearColor];
        self.carNumberLab .textColor = LINE9;
        self.carNumberLab .font = ZIFOUT12;
        [carModelVew addSubview:self.carNumberLab];
    }

    carModelVew.backgroundColor = [UIColor clearColor];
    [self addSubview:carModelVew];
    
    UIImageView *moneyImgV = [[UIImageView alloc]initWithFrame:CGRectMake(10+CGRectGetMaxX(self.timeLab.frame)+carModelVew.frame.size.width, CGRectGetMaxY(self.endLab.frame)+10, 12, 12)];
    if (self.model.type == 2) {
        moneyImgV.frame = CGRectMake(10+CGRectGetMaxX(carModelVew.frame), CGRectGetMaxY(self.endLab.frame)+10, 12, 12);
    }
    
    moneyImgV.backgroundColor = [UIColor clearColor];
    moneyImgV.image = [UIImage imageNamed:@"chat_money"];
    [self addSubview:moneyImgV];
    
    self.moneyLab = [[UILabel alloc]initWithFrame:CGRectMake(4+CGRectGetMaxX(moneyImgV.frame), 10+CGRectGetMaxY(self.endLab.frame), 100, 12)];
    self.moneyLab.backgroundColor = [UIColor clearColor];
    self.moneyLab.font = [UIFont systemFontOfSize:10];
    self.moneyLab.textColor = LINE9;
    [self addSubview:self.moneyLab];
    
    
    self.sureBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-160, 10, 70, 24)];
    self.sureBtn.backgroundColor = [UIColor clearColor];
    
    self.sureBtn.titleLabel.font = ZIFOUT14;
    [self.sureBtn setTitleColor:[UIColor colorFromHexString:@"0xa964b"] forState:UIControlStateNormal];
    self.sureBtn.layer.cornerRadius = 2.0;
    self.sureBtn.layer.masksToBounds = YES;
    self.sureBtn.layer.borderWidth = 1.0;
    self.sureBtn.layer.borderColor = [UIColor colorFromHexString:@"0xa964b"].CGColor;
    [self addSubview:self.sureBtn];
    
    self.cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-80, 10, 70, 24)];
    self.cancelBtn.backgroundColor = [UIColor clearColor];
    [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelBtn setTitleColor:LINE9 forState:UIControlStateNormal];
    self.cancelBtn.layer.cornerRadius = 2.0;
    self.cancelBtn.titleLabel.font = ZIFOUT14;
    self.cancelBtn.layer.masksToBounds = YES;
    self.cancelBtn.layer.borderWidth = 1.0;
    self.cancelBtn.layer.borderColor = LINE9.CGColor;
    [self addSubview:self.cancelBtn];
    
    if (self.type == 2) {
        [self.sureBtn setTitle:@"到达" forState:UIControlStateNormal];
    }else{
        [self.sureBtn setTitle:@"召集上车" forState:UIControlStateNormal];
    }
    
    self.startLab.text  = self.model.start;
    self.endLab.text    = self.model.end;
    self.timeLab.text   = self.model.time;
    self.moneyLab.text  = self.model.money;
    self.headImags      = self.model.headImgs;
    self.carNumberLab.text  = self.model.carNumber;
    
    for (int i=0; i<self.headImags.count; i++) {
        self.headImagV = [[EGOImageView alloc]initWithFrame:CGRectMake(10+i*55, CGRectGetMaxY(self.timeLab.frame)+16, 40, 40)];
        self.headImagV.backgroundColor = [UIColor clearColor];
        self.headImagV.layer.cornerRadius = 4.0;
        self.headImagV.imageURL = [NSURL URLWithString:self.headImags[i]];
        [self addSubview:self.headImagV];
    }
}


-(void)setModel:(MSChatModel *)model{
    _model  = model;

    [self initUI];
}


@end
