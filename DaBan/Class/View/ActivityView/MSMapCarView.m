//
//  MSMapCarView.m
//  DaBan
//
//  Created by qkm on 15-8-27.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSMapCarView.h"

@implementation MSMapCarView

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

   UIColor *mycolor = [UIColor  colorFromHexString:@"0x309df0"];
    _imageView = [[EGOImageView alloc] init];
    
    _imageView.frame = CGRectMake(10, 28,94, 94);
    _imageView.image = [UIImage  imageNamed:@"picture-noLog@2x.png"];
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.layer.cornerRadius =CGRectGetHeight([_imageView bounds]) / 2;
    _imageView.clipsToBounds = YES;
    [self addSubview:_imageView];
    
    self.sexImageView = [[UIImageView alloc]initWithFrame:CGRectMake(80, 98, 15, 15)];
    self.sexImageView.backgroundColor = [UIColor clearColor];
    [self addSubview:self.sexImageView];
    
    self.peopleLab = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-160,10, 100, 12)];
    self.peopleLab.backgroundColor = [UIColor clearColor];
    self.peopleLab.textAlignment = NSTextAlignmentRight;
    self.peopleLab.font = [UIFont systemFontOfSize:12.0];
    self.peopleLab.textColor = ZIRED;
    [self addSubview:self.peopleLab];
    
    UIImageView *comIV = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.peopleLab.frame)+13, 10, 14, 12)];
    comIV.backgroundColor = [UIColor clearColor];
    comIV.image = [UIImage imageNamed:@"activity_location_diao.png"];
    [self addSubview:comIV];
    
    self.comLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(comIV.frame)+5, 10, 30, 12)];
    self.comLab.backgroundColor = [UIColor clearColor];
    self.comLab.font = [UIFont systemFontOfSize:12.0];
    self.comLab.textColor = ZIRED;
    [self addSubview:self.comLab];
    
    self.nameLab = [[UILabel  alloc]initWithFrame:CGRectMake(124, 30, SCREEN_WIDTH, 20)];
    self.nameLab.backgroundColor = [UIColor clearColor];
    self.nameLab.font =  [UIFont fontWithName:HelveticaH size:14];
    self.nameLab.textColor = ZIGRAY;
    self.nameLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.nameLab];
    
    self.carNumLab = [[UILabel alloc]initWithFrame:CGRectMake(124, CGRectGetMaxY(self.nameLab.frame)+13, SCREEN_WIDTH, 14)];
    self.carNumLab.backgroundColor =  [UIColor clearColor];
    self.carNumLab.font = [UIFont fontWithName:Helvetica size:14];
    self.carNumLab.textColor = ZIGRAY;
    self.carNumLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.carNumLab];
    
    self.carModelsLab = [[UILabel alloc]initWithFrame:CGRectMake(124, CGRectGetMaxY(self.carNumLab.frame)+5, SCREEN_WIDTH, 14)];
    self.carModelsLab.backgroundColor = [UIColor clearColor];
    self.carModelsLab.font = [UIFont fontWithName:Helvetica size:14];
    self.carModelsLab.textColor = ZIGRAY;
    self.carModelsLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.carModelsLab];
    
    self.carColorLab = [[UILabel alloc]initWithFrame:CGRectMake(124, CGRectGetMaxY(self.carModelsLab.frame)+5, SCREEN_WIDTH, 14)];
    self.carColorLab.backgroundColor = [UIColor clearColor];
    self.carColorLab.font = [UIFont systemFontOfSize:15.0];
    self.carColorLab.textColor = ZIGRAY;
    self.carColorLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.carColorLab];
    
    
    self.canBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 140,SCREEN_WIDTH/2, 52)];
    self.canBtn.backgroundColor = mycolor;
    self.canBtn.tag = 1;
    [self.canBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.canBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.canBtn.titleLabel.font = [UIFont systemFontOfSize:23];
//    self.canBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self addSubview:self.canBtn];
    
    self.sureBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2,140 ,SCREEN_WIDTH/2, 52)];
    self.sureBtn.backgroundColor = mycolor;
    [self.sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    self.sureBtn.tag = 2;
//    self.sureBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    self.sureBtn.titleLabel.font = [UIFont systemFontOfSize:23];
    [self.sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:self.sureBtn];
    
   
    
}

-(void)setModel:(MSCarModel *)model{
    _model = model;
    _nameLab.text       = model.carName;
    _carNumLab.text     = model.carNumber;
    _carModelsLab.text  = model.carModels;
    _carColorLab.text   = model.carColor;
    _imageView.imageURL    = [NSURL URLWithString:model.handImg];
    _peopleLab.text     = [NSString stringWithFormat:@"搭伴人次 %@",model.people];
    _comLab.text        = [NSString stringWithFormat:@"%@",model.com];
    if (model.sex == 1) {
        self.sexImageView.image = [UIImage imageNamed:@"my_man"];
    }else if(model.sex == 2){
        self.sexImageView.image = [UIImage imageNamed:@"my_woman"];
    }

}

@end

