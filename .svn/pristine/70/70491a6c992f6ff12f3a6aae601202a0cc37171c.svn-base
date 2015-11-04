//
//  MSActivityTableViewCell.m
//  DaBan
//
//  Created by qkm on 15-8-21.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSActivityTableViewCell.h"

@implementation MSActivityTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
         [self initUI];
    }
    return self;
}

-(void)initUI{
 
    _imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/2+60, 153)];
    _imageV.backgroundColor = [UIColor clearColor];
    [self addSubview:_imageV];
    
    _titleLab = [[UILabel alloc] init];
    _titleLab.frame = CGRectMake(10, 20, SCREEN_WIDTH/2+60-40, 18);
    _titleLab.backgroundColor = [UIColor clearColor];
    _titleLab.textAlignment = NSTextAlignmentLeft;
    
    [_imageV addSubview:_titleLab];
    
    
    _timeLab = [[UILabel alloc] init];
    
    _timeLab.backgroundColor = [UIColor clearColor];
    
    _timeLab.textAlignment = NSTextAlignmentLeft;
    _timeLab.font = [UIFont systemFontOfSize:14];
    _timeLab.textColor = [UIColor whiteColor];
    [_imageV addSubview:_timeLab];
    
    _addrLab = [[UILabel alloc] init];
  
    _addrLab.backgroundColor = [UIColor clearColor];
  
    _addrLab.textAlignment = NSTextAlignmentLeft;
    _addrLab.font = [UIFont systemFontOfSize:14];
    _addrLab.textColor = [UIColor whiteColor];
    [_imageV addSubview:_addrLab];
    
    
    _carIV = [[UIImageView alloc]init];
    _carIV.backgroundColor = [UIColor clearColor];
    [_imageV addSubview:_carIV];
    
    
    UILabel *ziLab = [[UILabel alloc]initWithFrame:CGRectMake(10+27+4, 153-14-30, 150, 14)];
    ziLab.backgroundColor = [UIColor clearColor];
    ziLab.text = @"我要拼车";
    ziLab.font = ZIFOUT14;
    ziLab.textColor = [UIColor whiteColor];
    [_imageV addSubview:ziLab];
    

}

-(void)layoutSubviews{
    [super layoutSubviews];
    _titleLab.font = [UIFont systemFontOfSize:18];
    _titleLab.textColor = [UIColor whiteColor];
    _titleLab.numberOfLines = 2;
    CGSize size = [_titleLab sizeThatFits:CGSizeMake(_titleLab.frame.size.width, MAXFLOAT)];
    _titleLab.frame = CGRectMake(_titleLab.frame.origin.x, _titleLab.frame.origin.y , _titleLab.frame.size.width, size.height);
    
    _timeLab.frame = CGRectMake(10, CGRectGetMaxY(_titleLab.frame)+10,80, 14);
    
      _addrLab.frame = CGRectMake(CGRectGetMaxX(_timeLab.frame), CGRectGetMaxY(_titleLab.frame)+10, SCREEN_WIDTH/2+60-60-10, 14);
    
    _carIV.frame = CGRectMake(10, 153-14-30,27, 14);
}

-(void)setModel:(MSActivityModel *)model{
    _model = model;
    _timeLab.text  = model.time;
    _titleLab.text = model.title;
    _addrLab.text  = model.addr;
    _imageV.image  = [UIImage imageNamed:model.image];
    _carIV.image   = [UIImage imageNamed:model.carImg];
   
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}


@end
