//
//  TableViewCell.m
//
//
//  Created by  on 15/3/26.
//  Copyright (c) 2015年 ttg. All rights reserved.
//

#import "TableViewCell.h"
#import "DefineString.h"
#import "Defines.h"
#import "Colours.h"
#import "GlobalStyle.h"
@implementation TableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        _left = [UIButton buttonWithType:UIButtonTypeCustom];
        _left.frame = CGRectMake(0, 0, SCREEN_WIDTH/2, self.contentView.frame.size.height-1);
        _left.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_left];
        
        _right = [UIButton buttonWithType:UIButtonTypeCustom];
        _right.frame = CGRectMake(SCREEN_WIDTH/2, 0, SCREEN_WIDTH/2, self.contentView.frame.size.height-1);
        _right.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:_right];
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2, 0, 1, self.contentView.frame.size.height)];
        view.backgroundColor = UIColorFromRGB(0xDFDFDD);
        view.alpha = 0.9;
        [self.contentView addSubview:view];
        self.contentView.backgroundColor = UIColorFromRGB(0xD7D7D7);
    }
    return self;
}
- (void)awakeFromNib {
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
