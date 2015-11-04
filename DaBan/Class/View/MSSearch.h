//
//  MSSearch.h
//  DaBan
//
//  Created by qkm on 15-8-11.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSBaseView.h"
#import "MSCarModel.h"

@interface MSSearch : MSBaseView<UITextFieldDelegate>

@property (nonatomic, strong)UITextField *searchTextField;
@property (nonatomic, strong) MSCarModel *model;
@end
