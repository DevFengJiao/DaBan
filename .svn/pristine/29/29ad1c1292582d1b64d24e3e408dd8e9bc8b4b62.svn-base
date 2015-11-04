//
//  MSLineTableViewCell.m
//  DaBan
//
//  Created by qkm on 15-8-13.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSLineTableViewCell.h"
#import "Defines.h"
#import "GlobalStyle.h"
#import "Colours.h"

@implementation MSLineTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self initUI];
        
    }
    return self;
}


-(void)initUI{

    self.starlab = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, self.frame.size.width-20, 14)];
    self.starlab.backgroundColor = [UIColor clearColor];
    self.starlab.textColor = ZICOLOR;
    self.starlab.font = [UIFont systemFontOfSize:14.0];
    [self addSubview:self.starlab];
    
    self.endlab = [[UILabel alloc]initWithFrame:CGRectMake(10, 10+CGRectGetMaxY(self.starlab.frame), self.frame.size.width-20, 14)];
    self.endlab.backgroundColor = [UIColor clearColor];
    self.endlab.textColor = ZICOLOR;
    self.endlab.font = [UIFont systemFontOfSize:14.0];
    [self addSubview:self.endlab];
    
    self.timelab = [[UILabel alloc]initWithFrame:CGRectMake(10, 10+CGRectGetMaxY(self.endlab.frame), self.frame.size.width-20, 14)];
    self.timelab.backgroundColor = [UIColor clearColor];
    self.timelab.textColor = ZIGRAY;
    self.timelab.font = [UIFont systemFontOfSize:12.0];
    [self addSubview:self.timelab];
    
    self.contentlab = [[UILabel alloc]initWithFrame:CGRectMake(10, 10+CGRectGetMaxY(self.timelab.frame), self.frame.size.width-20, 14)];
    self.contentlab.backgroundColor = [UIColor clearColor];
    self.contentlab.textColor = ZIGRAY;
    self.contentlab.font = [UIFont systemFontOfSize:12.0];
    [self addSubview:self.contentlab];
    
    
    
}

-(void)setModel:(MSLineModel *)model{
    _model = model;
    self.starlab.text = model.start;
    self.endlab.text  = model.end;
    self.timelab.text = model.time;
    self.contentlab.text = model.content;
    
    if (!NULL_STR(model.content)) {
        self.frame = CGRectMake(10, self.frame.origin.y, SCREEN_WIDTH-20,CGRectGetMaxY(self.contentlab.frame)+10);
    }else{
        self.frame = CGRectMake(10, self.frame.origin.y, SCREEN_WIDTH-20,CGRectGetMaxY(self.timelab.frame)+10);
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
