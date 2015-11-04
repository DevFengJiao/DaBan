//
//  MessageNoteCell.m
//  NewLingYou
//
//  Created by fjzl on 15/6/2.
//  Copyright (c) 2015年 Seven. All rights reserved.
//

#import "MessageNoteCell.h"

@interface MessageNoteCell()
{
    UIView  * _centerView;
    UILabel * _titleTypeLab;
    UILabel * _timeLab;
    UILabel * _contentLab;
    UIButton * _showBtn;

}

@end


@implementation MessageNoteCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType  = UITableViewCellAccessoryNone;
        [self initialSetup];
    }
    return self;
}
-(void)initialSetup
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    _centerView = [[UIView alloc] initWithFrame:CGRectMake(5, 0, SCREEN_WIDTH - 5*2, 125)];
    _centerView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_centerView];
    
    _titleTypeLab = [[UILabel alloc] init];
    _titleTypeLab.frame = CGRectMake(10, 5, 70, 30);
    _titleTypeLab.backgroundColor = [UIColor clearColor];
    _titleTypeLab.textAlignment = NSTextAlignmentLeft;
    _titleTypeLab.font = [UIFont systemFontOfSize:15];
    _titleTypeLab.textColor = [UIColor blackColor];
   // _titleTypeLab.text = @"打赏";
    [self addSubview:_titleTypeLab];
    
    UIView  *line = [[UIView alloc] initWithFrame:CGRectMake(10, 35, SCREEN_WIDTH-10*2, 0.5)];
    line.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:line];
    
    
    _timeLab = [[UILabel alloc] init];
    _timeLab.frame = CGRectMake(SCREEN_WIDTH - 160 - 10, 5, 160, 30);
    _timeLab.backgroundColor = [UIColor clearColor];
    _timeLab.textAlignment = NSTextAlignmentRight;
    _timeLab.font = [UIFont systemFontOfSize:13];
    _timeLab.textColor = [UIColor lightGrayColor];
//    _timeLab.text = @"2015-06-02 21:12";
    [self addSubview:_timeLab];
    
    _contentLab = [[UILabel alloc] init];
    _contentLab.frame = CGRectMake(10, 37, SCREEN_WIDTH - 10*2,50);
    _contentLab.backgroundColor = [UIColor clearColor];
    _contentLab.textAlignment = NSTextAlignmentLeft;
    _contentLab.font = [UIFont systemFontOfSize:14];
    _contentLab.numberOfLines = 0;
    _contentLab.textColor = [UIColor lightGrayColor];
//    _contentLab.text = @"阿斯顿卢卡斯大悟萨斯觉得谁卡啊就是坑爹看见啦阿德凯撒看见爱死了看大家说的";
    [self addSubview:_contentLab];
    
    _showBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_showBtn setBackgroundColor:[UIColor clearColor]];
    _showBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_showBtn setTitle:@"查看全文" forState:UIControlStateNormal];
    [_showBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    [_showBtn setFrame:CGRectMake(SCREEN_WIDTH - 120, CGRectGetMaxY(_contentLab.frame), 100, 30)];
    _showBtn.userInteractionEnabled = NO;
    [self addSubview:_showBtn];
}

-(void)setCar:(MSCarModel *)car
{

    _timeLab.text = car.title;
    _contentLab.text = car.arce;

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
