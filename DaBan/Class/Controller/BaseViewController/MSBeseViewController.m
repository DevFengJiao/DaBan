//
//  MSBeseViewController.m
//  DaBan
//
//  Created by qkm on 15-7-30.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSBeseViewController.h"
#import "WTRequestCenter.h"


//加载失败错误信息
#define kDataErrorPrompt1   @"请检查您的设备是否已联网,下拉重新获取"
#define kDataErrorPrompt2   @"请检查您的设备是否已联网,\n点击按钮重新获取"



@interface MSBeseViewController ()

@end

@implementation MSBeseViewController
@synthesize errorView,emptyDataView;
@synthesize searchText = _searchText;
@synthesize searchButton = _searchButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.observeNetStateForRightBarItem = YES;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //在7.0系统才可执行
    if([UIViewController instancesRespondToSelector:@selector(edgesForExtendedLayout)]){
        self.edgesForExtendedLayout=UIRectEdgeNone;
    }
    [self setBackgroundAndNavbar];

    // 左返回按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame =CGRectMake(-10, 0, 32, 32);
    
    btn.backgroundColor = [UIColor clearColor];
    
    [btn addTarget: self action: @selector(exitAction) forControlEvents: UIControlEventTouchUpInside];
    
    UIBarButtonItem* item=[[UIBarButtonItem alloc]initWithCustomView:btn];
    
    UIImageView *iconIV = [[UIImageView alloc]initWithFrame:CGRectMake(-10, 5, 22, 22)];
    iconIV.backgroundColor = [UIColor clearColor];
    UIImage *image = [UIImage imageNamed:@"return"];
    iconIV.image = image;
    [btn addSubview:iconIV];
    self.navigationItem.leftBarButtonItem=item;
    
    

    // 左返回按钮
//    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStylePlain target:nil action:nil];
//    
//    //将返回按钮的文字position设置不在屏幕上显示
//    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(NSIntegerMin, NSIntegerMin) forBarMetrics:UIBarMetricsDefault];
//    UIImage *image = [[UIImage imageNamed:@"01-2返回(1)"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0,0 )];
//
//    [item setBackButtonBackgroundImage:image forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
////    [item setBackButtonBackgroundVerticalPositionAdjustment:10.0f forBarMetrics:UIBarMetricsDefault];
//    
////     [item setBackButtonTitlePositionAdjustment:UIOffsetMake(-20.f, 0)  forBarMetrics:UIBarMetricsDefault];
//    [[UINavigationBar appearance] setTintColor:[UIColor clearColor]];
//    self.navigationItem.backBarButtonItem = item;

    if (_isHideRightBarButtonItem)
    {
        //有了跳过按钮就把返回按钮隐藏
        self.navigationItem.rightBarButtonItem = nil;
    }

}
-(void)exitAction{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    if ( [_pageTitle length] > 0 ) {
//        UILabel* titleText = [[UILabel alloc]init];
//        titleText.font = [UIFont boldSystemFontOfSize:NAVIGATIONBAR_TITLE_FONT];
//        titleText.text = _pageTitle;
//        titleText.backgroundColor = [UIColor clearColor];
//        CGSize sizeIt = [_pageTitle sizeWithFont:titleText.font];
//        titleText.frame = CGRectMake(0, 0, sizeIt.width, sizeIt.height);
//        titleText.textColor = ZI_NACOLOR;
//        titleText.shadowColor = NAVIGATIONBAR_BACK_COLOR;
//        titleText.shadowOffset = NAVIGATIONBAR_TEXT_OFFSET;
//        [titleText setNumberOfLines:0];
//        titleText.textAlignment = NSTextAlignmentCenter;
//        self.navigationItem.titleView = titleText;
//    }
}




- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.isFrontViewControl = YES;
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.isFrontViewControl = NO;
}
//导航栏背影色
- (void)setBackgroundAndNavbar
{
//    UIImage *image = [[UIImage imageNamed:@"btn-green@2x"] stretchableImageWithLeftCapWidth:1 topCapHeight:5];
//    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.view.backgroundColor = BACK_GRAY_COLOR;
    //[self setDefaultLeftButtonItemWithAction:nil];

}


#pragma mark - 显示页面加载错误信息
- (RefreshLinkErrorView *)showLoadErrorView
{
    return [self showLoadErrorViewWithReloadAction:NULL];
}

- (RefreshLinkErrorView *)showLoadErrorViewWithText:(NSString *)text
{
    return [self showLoadErrorViewWithText:text reloadAction:NULL];
}

- (RefreshLinkErrorView *)showLoadErrorViewInView:(UIView *)view withText:(NSString *)text
{
    return [self showLoadErrorViewInView:view withText:text reloadAction:NULL];
}

- (RefreshLinkErrorView *)showLoadErrorViewWithReloadAction:(SEL)reloadAction
{
    return [self showLoadErrorViewWithText:kDataErrorPrompt2 reloadAction:reloadAction];
}

- (RefreshLinkErrorView *)showLoadErrorViewWithText:(NSString *)text reloadAction:(SEL)reloadAction
{
    return [self showLoadErrorViewInView:self.view withText:text reloadAction:reloadAction];
}

- (RefreshLinkErrorView *)showLoadErrorViewInView:(UIView *)view withText:(NSString *)text reloadAction:(SEL)reloadAction
{
    [self hideLoadErrorView];
    
    RefreshLinkErrorView* eView = [[RefreshLinkErrorView alloc]init];
    self.errorView = eView;
    
    [errorView.prompt setText:text];
    
    CGFloat errWidth = view.frame.size.width;
    CGFloat errHeight = [errorView heightWithWidth:errWidth];
    CGFloat errPosX = 0;
    CGFloat errPosY = (view.frame.size.height - errHeight)/2.0;
    
    errorView.frame = CGRectMake(errPosX, errPosY, errWidth, errHeight);
    if ( reloadAction ) {
        [errorView setShowBtn:YES];
        [errorView.btn addTarget:self
                          action:reloadAction
                forControlEvents:UIControlEventTouchUpInside];
    }
    
    errorView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
    
    [view addSubview:errorView];
    
    return self.errorView;
}

- (RefreshLinkErrorView *)showNoDataErrorViewInView:(UIView *)view withTitle:(NSString *)title andText:(NSString *)text action:(SEL)action
{
    [self hideLoadErrorView];
    
    self.errorView = [RefreshLinkErrorView refreshNoDataViewWithPromptMsg:text];
    [self.errorView.title setText:title];
    
    CGFloat errWidth = view.frame.size.width;
    CGFloat errHeight = [errorView heightWithWidth:errWidth];
    CGFloat errPosX = 0;
    CGFloat errPosY = (view.frame.size.height - errHeight)/2.0;
    
    errorView.frame = CGRectMake(errPosX, errPosY, errWidth, errHeight);
    if ( action ) {
        [errorView setShowBtn:YES];
        [errorView.btn addTarget:self
                          action:action
                forControlEvents:UIControlEventTouchUpInside];
    }
    
    [view addSubview:errorView];
    
    return self.errorView;
}

- (void)hideLoadErrorView
{
    [errorView removeFromSuperview];
    self.errorView = nil;
    if (self.emptyDataView)
    {
        [self.emptyDataView removeFromSuperview];
        self.emptyDataView = nil;
    }
}

- (void)showEmptyInfoView
{
    [self showEmptyInfoViewWithText:KNoDataErrorTitle];
}

- (void)showEmptyInfoViewWithText:(NSString *)text
{
    [self showEmptyInfoViewInView:self.view withText:text];
}

- (void)showEmptyInfoViewInView:(UIView *)view withText:(NSString *)text
{
    RefreshEmptyDataView* emptyView = [[RefreshEmptyDataView alloc]init];
    emptyView.errText.text = text;
    self.emptyDataView = emptyView;
    
    CGFloat errWidth = view.frame.size.width;
    CGFloat errHeight = view.frame.size.height;
    CGFloat errPosX = 0;
    CGFloat errPosY = 80;
    
    CGSize size = [text sizeWithFont:emptyDataView.errText.font constrainedToSize:CGSizeMake(emptyDataView.errText.frame.size.width, 1000)];
    errHeight = size.height;
    
    emptyDataView.frame = CGRectMake(errPosX, errPosY, errWidth, errHeight);
    [view addSubview:emptyDataView];
}




//提示框
- (void)showMyMessage:(NSString*)aInfo {
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:aInfo
                                                       delegate:nil
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil, nil];
    
    
    [alertView show];
    
}

#pragma mark---展示TabBar
- (void)showTabBar
{
    self.tabBarController.tabBar.hidden = NO;
}


#pragma mark---隐藏TabBar
- (void)hideTabBar
{
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

-(void)addTopSearch
{
    
    if (! searchView)
    {
        
        searchView = [[UIView alloc]initWithFrame:CGRectMake(-70.0, 0.0,SCREEN_WIDTH, 30.0)];
        //searchView.backgroundColor =  YuYinViewBGColor;
        self.navigationItem.titleView  = searchView;
        searchView.userInteractionEnabled = YES;
        
        UIView *searchTextfieldBG = [[UIView alloc ]initWithFrame:CGRectMake(0.0, 0.0,SCREEN_WIDTH -80.0, 30.0 )];
        searchTextfieldBG.backgroundColor = [UIColor whiteColor];
        searchTextfieldBG.layer.borderColor = [UIColor whiteColor].CGColor;
        searchTextfieldBG.layer.cornerRadius = 10.0;
        searchTextfieldBG.layer.borderWidth = 1.0;
        [searchView addSubview:searchTextfieldBG];
        
        UIImageView *searchIcon = [[UIImageView alloc] initWithFrame:CGRectMake(5.0, 8.0, 14.0, 14.0)];
        searchIcon.image = [UIImage imageNamed:@"mapSearch-s@2x"];
        [searchTextfieldBG addSubview:searchIcon];
        
        //搜索框的设置 fjw
        self.searchText = [[UITextField alloc] initWithFrame:CGRectMake(25.0, 0.0, searchTextfieldBG.frame.size.width - 30.0, 30.0)];
        _searchText.delegate = self;
        _searchText.backgroundColor = [UIColor clearColor];
        _searchText.font = [UIFont systemFontOfSize:16.0];
        _searchText.textColor = ZIGRAY;
        _searchText.placeholder = @"输入关键字...";
        _searchText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _searchText.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        _searchText.returnKeyType = UIReturnKeySearch;
        [searchTextfieldBG addSubview:_searchText];
        
//        //搜索按钮的设置 fjw
//        self.searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
//        self.searchButton.backgroundColor = [UIColor clearColor];
//        //[_searchButton setTitle:@"搜索" forState:UIControlStateNormal];
////        [_searchButton setBackgroundImage:[UIImage imageNamed:@"sure.png"] forState:UIControlStateNormal];
//        [_searchButton setTitleColor:HEXCOLOR(0x2069c0) forState:UIControlStateNormal];
//        [_searchButton setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
//        _searchButton.titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
//        [_searchButton addTarget:self action:@selector(voiceSearchButtonClickon:) forControlEvents:UIControlEventTouchUpInside];
//        [_searchButton setFrame:CGRectMake(_searchText.frame.origin.x + _searchText.frame.size.width , 0 , 50, 40)];
//        [searchView addSubview:_searchButton];
//        
//        
//        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(20, 7.5, 20, 15)];
//        imageV.image = [UIImage  imageNamed:@"sure.png"];
//        imageV.backgroundColor = [UIColor clearColor];
//        [_searchButton addSubview:imageV];
    }
    
    
}
-(void)voiceSearchButtonClickon:(UIButton *)paramBut
{
    
}

-(void)setNavigationBarRightbutton:(NSString *)title{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(20, 0, 60, 20);
    [rightBtn setTitle:title forState:UIControlStateNormal];
    rightBtn.backgroundColor = [UIColor clearColor];
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [rightBtn setTintColor:[UIColor whiteColor]];
    [rightBtn addTarget:self action:@selector(rightBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    editButton.width = 20;
    self.navigationItem.rightBarButtonItem = editButton;
    

}

-(void)rightBtnAction: (UIButton *)sender{
 
}

-(void)setNavigationBarRightbuttonImage:(NSString *)image{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(20, 0, 40, 40);
    [rightBtn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    rightBtn.backgroundColor = [UIColor clearColor];
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [rightBtn setTintColor:[UIColor whiteColor]];
    [rightBtn addTarget:self action:@selector(rightBtnActionImage:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    editButton.width = 20;
    self.navigationItem.rightBarButtonItem = editButton;
    
    
}

-(void)setBelowButtonTitle:(NSString *)title{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, SCREEN_HEIGHT-64-52,SCREEN_WIDTH, 52);
    [rightBtn setTitle:title forState:UIControlStateNormal];
    rightBtn.backgroundColor = BUTCOLOR;
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    [rightBtn setTintColor:[UIColor whiteColor]];
    rightBtn.titleLabel.font = [UIFont fontWithName:HelveticaH size:23];
    [rightBtn addTarget:self action:@selector(belowBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightBtn];

}


-(void)rightBtnActionImage: (UIButton *)sender{
    
}

-(void)belowBtnClick{

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSString *)url{
  
    NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:@"session_token"];
    
    NSString *url1 = [url stringByReplacingOccurrencesOfString:@"+" withString:@"%2b"];
    
    NSString *url2 = [url1 stringByReplacingOccurrencesOfString:@"/" withString:@"%2f"];
    
    NSString *url3 = [url2 stringByReplacingOccurrencesOfString:@"=" withString:@"%3d"];
    return url3;
    
}

+ (NSString *)formatSpecialJsonString:(NSString *)jsonStr {
    if (!jsonStr) {
        return nil;
    }
    
    
    if ([jsonStr hasPrefix:@"\""]) {
        NSMutableString *result = [NSMutableString stringWithString:jsonStr];
        NSRange range = NSMakeRange(0, [result length]);
        [result replaceOccurrencesOfString:@"\\\"" withString:@"\"" options:NSCaseInsensitiveSearch range:range];
        
        return [result substringWithRange:NSMakeRange(1, [result length] - 2)];
    } else {
        return jsonStr;
    }
}

#pragma mark -
+ (NSDictionary *)changeSpecialDataToDictionary:(id)data
{
    NSString * resultStr = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    NSString * str = nil;
    NSString * strr = [resultStr stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    if (strr.length > 3  &&  !strr) {
        str = [strr substringWithRange:NSMakeRange(1, strr.length -2)];
    }
    str = [strr substringWithRange:NSMakeRange(1, strr.length -2)];
    NSData * resultData = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:resultData options:0 error:nil];
    
    return dic;
}

@end
