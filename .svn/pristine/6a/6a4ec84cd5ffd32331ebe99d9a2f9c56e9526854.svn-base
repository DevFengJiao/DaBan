//
//  MSChatCell.m
//  DaBan
//
//  Created by qkm on 15-9-9.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSChatCell.h"
#import "Colours.h"

@implementation MSChatCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.backgroundColor = [UIColor whiteColor];
    if (self) {
        self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake(68, 15, self.bounds.size.width-90, 16)];
        self.titleLab.backgroundColor = [UIColor clearColor];
        self.titleLab.font = ZIFOUT16;
        self.titleLab.textColor = ZICOLOR;
        [self addSubview:self.titleLab];
        
        UIImageView *timeIV = [[UIImageView alloc]initWithFrame:CGRectMake(68, 14+CGRectGetMaxY(self.titleLab.frame), 12, 12)];
        timeIV.backgroundColor = [UIColor clearColor];
        timeIV.image = [UIImage imageNamed:@"chat_time"];
        [self addSubview:timeIV];
        
        self.timeLab = [[UILabel alloc]initWithFrame:CGRectMake(3+CGRectGetMaxX(timeIV.frame), 12+CGRectGetMaxY(self.titleLab.frame), self.bounds.size.width-90, 16)];
        self.timeLab.backgroundColor = [UIColor clearColor];
        self.timeLab.font = [UIFont systemFontOfSize:12];
        self.timeLab.textColor = ZIGRAY;
        [self addSubview:self.timeLab];
        
        self.identIV = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-67, 48, 12, 12)];
        self.identIV.backgroundColor = [UIColor clearColor];
        [self addSubview:self.identIV];
        
        self.identLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.identIV.frame)+3, 61-14, 14*3, 14)];
        self.identLab.backgroundColor = [UIColor clearColor];
        self.identLab.font = ZIFOUT14;
        self.identLab.textColor = ZICOLOR;
        [self addSubview:self.identLab];
        
    }
    return self;
}

-(void)setModel:(MSChatModel *)model{
    _model = model;
    self.timeLab.text = model.time;
    self.titleLab.text = model.title;
    if ([model.identf isEqualToString:@"1"]) {
        self.identIV.image = [UIImage imageNamed:@"chat_start"];
        self.identLab.text = @"正在拼";
    }else{
        self.identIV.image = [UIImage imageNamed:@"chat_end"];
        self.identLab.text = @"已结束";
        self.identLab.textColor = LINE9;
    }
    self.images = model.headImgs;
    for (int i =0; i<self.images.count; i++) {
        self.headIV = [[EGOImageView alloc]init];
        self.headIV.frame = CGRectMake(10+i%2*26, 11+i/2*26, 23, 23);
        self.headIV.imageURL = [NSURL URLWithString:self.images[i]];
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.headIV];
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
