//
//  MSSearch.m
//  DaBan
//
//  Created by qkm on 15-8-11.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSSearch.h"


@implementation MSSearch

-(id)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
    
}

-(void)setUp{

    UIView *bgV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    bgV.backgroundColor = [UIColor clearColor];
    [self addSubview:bgV];
    
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, bgV.frame.size.width-20, 40)];
    imageV.image = [UIImage  imageNamed:@"map-search.png"];
    imageV.userInteractionEnabled = YES;
    [bgV addSubview:imageV];
    
    UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(10, 12.5, 15, 15)];
    icon.backgroundColor = [UIColor clearColor];
    icon.image = [UIImage imageNamed:@"mapSearch-s.png"];
    [imageV addSubview:icon];
    
    
    _searchTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(icon.frame)+10, 0, 200, 40)];
 
    _searchTextField.backgroundColor = [UIColor clearColor];
   
    _searchTextField.tag = 10;
    _searchTextField.keyboardType = UIKeyboardTypeNumberPad;
    _searchTextField.delegate = self;
    _searchTextField.font = [UIFont systemFontOfSize:14.0];
    
    [imageV addSubview:_searchTextField];
}

-(void)setModel:(MSCarModel *)model{
    _model = model;
    UIColor *color = LINE9;
    _searchTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:model.searchName attributes:@{NSForegroundColorAttributeName: color}];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [_searchTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{

    [_searchTextField resignFirstResponder];
    
    return YES;
}

@end
