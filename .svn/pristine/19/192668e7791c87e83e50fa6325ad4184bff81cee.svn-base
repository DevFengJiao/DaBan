//
//  MSWalleCell.m
//  DaBan
//
//  Created by qkm on 15-8-19.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSWalleCell.h"
#import "Colours.h"

@implementation MSWalleCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _imagV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 20, 15, 15)];
        _imagV.backgroundColor = [UIColor clearColor];
        [self addSubview:_imagV];
        
        _titleLab = [[UILabel alloc] init];
        _titleLab.frame = CGRectMake(CGRectGetMaxX(_imagV.frame)+10, 0, 100, 55);
        _titleLab.backgroundColor = [UIColor clearColor];
        _titleLab.textColor = ZIGRAY;
        _titleLab.textAlignment = NSTextAlignmentLeft;
        _titleLab.font = [UIFont fontWithName:@"Helvetica" size:15];
        [self addSubview:_titleLab];
    }
    return self;
}

-(void)setModel:(MSWalletModel *)model{
    _model = model;
    _imagV.image = [UIImage imageNamed:model.cellImg];
    _titleLab.text = model.cellTitle;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
