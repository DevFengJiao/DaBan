//
//  MSBeseViewController.h
//  DaBan
//
//  Created by qkm on 15-7-30.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshEmptyDataView.h"
#import "RefreshLinkErrorView.h"
#import "WTRequestCenter.h"
#import "UINavigationItem+mk.h"
#import "Defines.h"
#import "Colours.h"
#import "EGOImageView.h"
#import "SVProgressHUD.h"
#import "ASIHTTPRequest.h"
#import "Reachability.h"


@interface MSBeseViewController : UIViewController<UITextFieldDelegate,UITableViewDataSource>

{
    UIView *searchView;

}

//+ (id)viewController;

- (UIButton *)rightNavigationBarButton;

//
//- (void)setLeftBarButtonItem:(UIBarButtonItem *)leftItem;
//- (void)setRightBarButtonItem:(UIBarButtonItem *)rightItem;

//navigationbar右上角按钮的点击状态是否根据请求状态的改变而改变,默认YES
@property(nonatomic)BOOL observeNetStateForRightBarItem;

@property(nonatomic,assign) BOOL        isHideRightBarButtonItem;
@property(nonatomic,assign) BOOL        isFrontViewControl;
@property(nonatomic,retain) RefreshLinkErrorView *errorView;
@property(nonatomic,retain) RefreshEmptyDataView *emptyDataView;
@property(nonatomic,copy)   NSString    *pageTitle;
@property(nonatomic,strong) UITextField *searchText;
@property(nonatomic,strong) UIButton    *searchButton;

//显示页面加载错误信息
- (RefreshLinkErrorView *)showLoadErrorView;
- (RefreshLinkErrorView *)showLoadErrorViewWithText:(NSString *)text;
- (RefreshLinkErrorView *)showLoadErrorViewInView:(UIView *)view withText:(NSString *)text;
- (RefreshLinkErrorView *)showLoadErrorViewWithReloadAction:(SEL)reloadAction;
- (RefreshLinkErrorView *)showLoadErrorViewWithText:(NSString *)text reloadAction:(SEL)reloadAction;
- (RefreshLinkErrorView *)showLoadErrorViewInView:(UIView *)view withText:(NSString *)text reloadAction:(SEL)reloadAction;
- (RefreshLinkErrorView *)showNoDataErrorViewInView:(UIView *)view withTitle:(NSString *)title andText:(NSString *)text action:(SEL)action;
- (void)hideLoadErrorView;

//显示页面内容为空的信息
- (void)showEmptyInfoView;
- (void)showEmptyInfoViewWithText:(NSString *)text;
- (void)showEmptyInfoViewInView:(UIView *)view withText:(NSString *)text;


/**
 *  弹窗,提示框
 */
- (void)showMyMessage:(NSString*)aInfo;

/**
 *  展示TabBar
 */
- (void)showTabBar;


/**
 *  隐藏TabBar
 */
- (void)hideTabBar;

+ (NSString *)formatSpecialJsonString:(NSString *)jsonStr;
+ (NSDictionary *)changeSpecialDataToDictionary:(id)data;


-(void)addTopSearch;

-(void)setNavigationBarRightbutton:(NSString*)title;
-(void)setNavigationBarRightbuttonImage:(NSString*)image;

-(void)setBelowButtonTitle:(NSString*)title;
-(NSString *)url;
@end
