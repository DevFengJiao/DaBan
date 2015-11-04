//
//  MSLoginViewController.h
//  DaBan
//
//  Created by qkm on 15-7-31.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSBeseViewController.h"
#import "WTRequestCenter.h"
#import "DefineString.h"
#import "Defines.h"
#import "GlobalStyle.h"
#import "Colours.h"

@interface MSLoginViewController : MSBeseViewController<UITextFieldDelegate>

{
    UITextField     *telTextField;
    UITextField     *codeTextField;
    UIButton        *agreeBtn;
    NSTimer         *_timer;
    NSInteger       flags;
    int             timeTick;
    UIButton        *valiButton;
    UIButton        *thirdLogBtn;
}
@property (nonatomic, strong) UIButton *nextButton;
@property (nonatomic, strong) NSMutableArray *indexS;

@property (nonatomic, assign) int  type; //0是返回前一个页面 1是返回到我的页面
@end
