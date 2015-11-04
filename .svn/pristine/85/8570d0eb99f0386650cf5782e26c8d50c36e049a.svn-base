//
//  MSSearchView.m
//  DaBan
//
//  Created by qkm on 15-8-21.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSSearchView.h"

@implementation MSSearchView

-(id)init
{
    self = [super init];
    if (self) {
        [self addTopSearch];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTopSearch];
    }
    return self;
    
}

-(void)addTopSearch
{

        UIView *searchTextfieldBG = [[UIView alloc ]initWithFrame:CGRectMake(10.0, 10.0,SCREEN_WIDTH -20.0, 40 )];
        searchTextfieldBG.backgroundColor = [UIColor whiteColor];
        searchTextfieldBG.layer.borderColor = [UIColor whiteColor].CGColor;
        searchTextfieldBG.layer.cornerRadius = 4.0;
        searchTextfieldBG.layer.borderWidth = 1.0;
        [self addSubview:searchTextfieldBG];
        
//        UIImageView *searchIcon = [[UIImageView alloc] initWithFrame:CGRectMake(3.0, 8.0, 14.0, 14.0)];
//        searchIcon.image = [UIImage imageNamed:@"mapSearch-s@2x"];
//        [searchTextfieldBG addSubview:searchIcon];
    
        //搜索框的设置 fjw
        self.searchText = [[UITextField alloc] initWithFrame:CGRectMake(3.0, 0.0, searchTextfieldBG.frame.size.width - 60.0, 40)];
        _searchText.backgroundColor = [UIColor clearColor];
        _searchText.font = [UIFont systemFontOfSize:15.0];
        _searchText.textColor = ZIGRAY;
        _searchText.placeholder = @"输入关键字...";
//        _searchText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _searchText.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _searchText.returnKeyType = UIReturnKeySearch;
        _searchText.keyboardType = UIKeyboardAppearanceDefault;
        _searchText.delegate = self;
        [searchTextfieldBG addSubview:_searchText];
        
        //搜索按钮的设置 fjw
        self.searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.searchButton.backgroundColor = [UIColor clearColor];
        //[_searchButton setTitle:@"搜索" forState:UIControlStateNormal];
        //        [_searchButton setBackgroundImage:[UIImage imageNamed:@"sure.png"] forState:UIControlStateNormal];
        [_searchButton setTitleColor:HEXCOLOR(0x2069c0) forState:UIControlStateNormal];
        [_searchButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        _searchButton.titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
        [_searchButton addTarget:self action:@selector(voiceSearchButtonClickon:) forControlEvents:UIControlEventTouchUpInside];
        [_searchButton setFrame:CGRectMake(_searchText.frame.origin.x + _searchText.frame.size.width , 0 , 50, 40)];
        [searchTextfieldBG addSubview:_searchButton];
        
        
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(30, 10, 20, 20)];
        imageV.image = [UIImage  imageNamed:@"mapSearch-s@2x"];
        imageV.backgroundColor = [UIColor clearColor];
        [_searchButton addSubview:imageV];

}

-(void)voiceSearchButtonClickon:(UIButton *)paramBut
{
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.searchText resignFirstResponder];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    
    [self.searchText resignFirstResponder];
    
    return YES;
}

@end
