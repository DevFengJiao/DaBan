//
//  MSSearchView.h
//  DaBan
//
//  Created by qkm on 15-8-21.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSBaseView.h"

@interface MSSearchView : MSBaseView<UITextFieldDelegate>

@property(nonatomic,strong) UITextField *searchText;
@property(nonatomic,strong) UIButton *searchButton;
@end
