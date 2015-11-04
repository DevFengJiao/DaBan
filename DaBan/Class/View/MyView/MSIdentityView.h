//
//  MSIdentityView.h
//  DaBan
//
//  Created by qkm on 15-8-24.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSBaseView.h"
#import "MSWalletModel.h"

@interface MSIdentityView : MSBaseView<UITextFieldDelegate>

@property (nonatomic, strong) UIButton      *btnPhoto;
@property (nonatomic, strong) UIButton      *nextButton;
@property (nonatomic, strong) UIImageView   *imageView;
@property (nonatomic, strong) UITextField   *nameTextField;
@property (nonatomic, strong) UITextField   *numberTextField;

@property (nonatomic, strong) MSWalletModel *model;
@end
