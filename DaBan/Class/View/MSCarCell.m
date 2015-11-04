//
//  MSCarCell.m
//  DaBan
//
//  Created by qkm on 15-8-5.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSCarCell.h"

@implementation MSCarCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        addCarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [addCarBtn setBackgroundColor:[UIColor redColor]];
        [addCarBtn setBackgroundImage:[UIImage imageNamed:@"actiday_backImg"] forState:UIControlStateNormal];
        
        [self addSubview:addCarBtn];
        
        titleLab = [[UILabel alloc] init];
        titleLab.frame = CGRectMake(10, 4, 70, 30);
        titleLab.backgroundColor = [UIColor blueColor];
        titleLab.textAlignment = NSTextAlignmentLeft;
        titleLab.font = [UIFont systemFontOfSize:17];
       
        [self addSubview:titleLab];
        
        arecLab = [[UILabel alloc] init];
        arecLab.frame = CGRectMake(100, 4, 80, 30);
        arecLab.backgroundColor = [UIColor clearColor];
        arecLab.textAlignment = NSTextAlignmentLeft;
        arecLab.font = [UIFont systemFontOfSize:14];
        arecLab.numberOfLines = 0;
        arecLab.textColor = [UIColor lightGrayColor];
       
        [self addSubview:arecLab];
    }
    return self;
}


-(void)setModel:(MSCarModel *)model{
    titleLab.text = model.title;
    arecLab.text = model.arce;
    
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
