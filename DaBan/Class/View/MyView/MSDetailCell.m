//
//  MSDetailCell.m
//  DaBan
//
//  Created by qkm on 15-8-19.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSDetailCell.h"
#import "Colours.h"

@implementation MSDetailCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
//        _imagV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 7.5, 30, 30)];
//        _imagV.backgroundColor = [UIColor clearColor];
//        _imagV.image = [UIImage imageNamed:@""];
//        [self addSubview:_imagV];
        
        _titleLab = [[UILabel alloc] init];
        _titleLab.frame = CGRectMake(10, 7.5, SCREEN_WIDTH/3, 30);
        _titleLab.backgroundColor = [UIColor clearColor];
        _titleLab.textColor = ZICOLOR;
        _titleLab.textAlignment = NSTextAlignmentLeft;
        _titleLab.font = [UIFont fontWithName:@"Helvetica" size:16];
        [self addSubview:_titleLab];
        
        _conetLab = [[UILabel alloc] init];
        _conetLab.frame = CGRectMake(SCREEN_WIDTH-50, 10, 40, 16);
        _conetLab.backgroundColor = [UIColor clearColor];
        _conetLab.textColor = APP_COLOR;
        _conetLab.textAlignment = NSTextAlignmentRight;
        _conetLab.font = [UIFont fontWithName:@"Helvetica" size:16];
        [self addSubview:_conetLab];
        
        _timelLab = [[UILabel alloc] init];
        _timelLab.frame = CGRectMake(SCREEN_WIDTH-120,CGRectGetMaxY(_conetLab.frame)+10 , 110, 12);
        _timelLab.backgroundColor = [UIColor clearColor];
        _timelLab.textColor = ZIGRAY;
        _timelLab.textAlignment = NSTextAlignmentRight;
        _timelLab.font = [UIFont fontWithName:@"Helvetica" size:12];
        [self addSubview:_timelLab];
        
    }
    return self;
}

-(void)setModel:(MSWalletModel *)model{
    _model = model;
    _timelLab.text = model.priceTime;
    _conetLab.text = model.priceCon;
    _titleLab.text = model.price;
    if ([_conetLab.text isEqualToString:@"收入"]) {
        _conetLab.textColor = ZICOLOR;
    }else{
        _conetLab.textColor = APP_COLOR;
    }
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
