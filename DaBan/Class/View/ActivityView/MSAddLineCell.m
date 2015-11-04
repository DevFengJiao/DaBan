//
//  MSAddLineCell.m
//  DaBan
//
//  Created by qkm on 15-8-28.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSAddLineCell.h"

@implementation MSAddLineCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initUI];
        
    }
    return self;
}

-(void)initUI{

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
