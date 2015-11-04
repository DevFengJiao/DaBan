//
//  MSAppDelegate.m
//  DaBan
//
//  Created by qkm on 15-7-30.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSAppDelegate.h"
#import "MSAppDelegate+MainUI.h"
#import "MSIdenViewController.h"
#import "ASIHTTPRequest.h"
#import "SVProgressHUD.h"
#import "UMSocial.h"
#import "UMSocialControllerService.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialQQHandler.h"
//#import "UMSocialSinaHandler.h"
#import "UMSocialSinaSSOHandler.h"
#import "AVOSCloud/AVOSCloud.h"
#import "CDUserFactory.h"

@implementation MSAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstStart"])
    {
        [self showIntruScrollView];
    }
    else
    {
        self.mainVC = [self fetchTabbarController];
        self.window.rootViewController = self.mainVC;
    }
    
    self.window.backgroundColor = [UIColor whiteColor];
    	
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(memberLogin) name:LingYouLogInNotification object:nil];
//    
//    
//    [self easemobApplication:application didFinishLaunchingWithOptions:launchOptions];
//    
//    [self XinGePushWith:launchOptions];
//    //向微信注册
//    [WXApi registerApp:@"wx7358f4e7886435db" withDescription:@"LingYou 1.0"];
//    
//    NSString *UserID = [[NSUserDefaults standardUserDefaults] objectForKey:@"USERID"];
//    NSLog(@"用户的userId-------%@",UserID);
    
//    if (launchOptions) {
//        NSDictionary  * userInfo = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
//        [self presentViewControllerWithUserInfo:userInfo];
//    }
//
    
    [UMSocialData setAppKey:kUMSocialKey];
    //设置微信AppId，设置分享url，默认使用友盟的网址
    [UMSocialWechatHandler setWXAppId:wxAppID appSecret:wxAppSecret url:@"http://www.qingkemai.com/"];
    
    //打开新浪微博的SSO开关
    //    [UMSocialSinaHandler openSSOWithRedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    [UMSocialSinaSSOHandler openNewSinaSSOWithRedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    //    //设置分享到QQ空间的应用Id，和分享url 链接
    [UMSocialQQHandler setQQWithAppId:@"1104788353" appKey:@"1XIGKDuYoZrvD3bW" url:@"http://www.qingkemai.com/"];

    
    [AVOSCloud setApplicationId:kApplicationId clientKey:kClientKey];
    //实例化核心聊天管理
    [CDChatManager manager].userDelegate = [[CDUserFactory alloc] init];
#ifdef DEBUG
    [AVAnalytics setAnalyticsEnabled:NO];
    [AVOSCloud setAllLogsEnabled:YES];
//    [AVOSCloud setVerbosePolicy:kAVVerboseShow];
//    [AVLogger addLoggerDomain:AVLoggerDomainIM];
//    [AVLogger addLoggerDomain:AVLoggerDomainCURL];
//    [AVLogger setLoggerLevelMask:AVLoggerLevelAll];
#endif
    //打开最近的所有聊天记录
    [[CDChatManager manager] openWithClientId:@"ff" callback: ^(BOOL succeeded, NSError *error) {
        
    }];
    
    //每次启动更新token
    
    NSString *st = [[NSUserDefaults standardUserDefaults] objectForKey :@"USERID"];
    //如果已经登录就更新
    if (!NULL_STR(st)) {
      [self requestAuto_login];
    }
    
    //修改ios7下statusbar风格
    if ( !SYSTEM_VERSION_LESS_THAN(@"7.0") ) {
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)requestAuto_login{
    NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:@"session_token"];
    
    NSString *url1 = [url stringByReplacingOccurrencesOfString:@"+" withString:@"%2b"];
    
    NSString *url2 = [url1 stringByReplacingOccurrencesOfString:@"/" withString:@"%2f"];
    
    NSString *url3 = [url2 stringByReplacingOccurrencesOfString:@"=" withString:@"%3d"];
    
    NSURL *url4 = [NSURL URLWithString:[NSString stringWithFormat:@"%@auto_login?token=%@",DaBan_URL,url3]];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url4];
    
    [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
    
    [request addRequestHeader:@"Accept" value:@"application/json"];
    
    [request setRequestMethod:@"POST"];
    
    [request startSynchronous];
    
    NSError *error1 = [request error];
    if (!error1) {
        NSString *response = [request responseString];
        NSData *data = [response dataUsingEncoding:NSUTF8StringEncoding];
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        if ([[result objectForKey:@"retcode"]intValue] != 0) {
            
        }else{
            
            NSString *tem = result[@"data"];
            NSData* myData=[tem dataUsingEncoding:NSUTF8StringEncoding];
            
            id dictionary2 = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingAllowFragments error:nil];
            
//            NSLog(@"dic2:-%@",dictionary2);
            NSString *session_token = dictionary2[@"session_token"];
//            NSLog(@"token--%@",session_token);
            [[NSUserDefaults standardUserDefaults] setObject:session_token forKey:@"session_token"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        
        
    }
    
}


#pragma mark -
#pragma mark -产品引导
-(void)showIntruScrollView
{
    //
    
    self.window.backgroundColor = [UIColor blackColor];
    
    headlogoView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, 10.0, self.window.frame.size.width, 100.0)];
    headlogoView.backgroundColor = [UIColor clearColor];
    headlogoView.image = [UIImage imageNamed:@"viewBGLogo"];
    [self.window addSubview:headlogoView];
    
    self.window.backgroundColor = [UIColor blackColor];
    
    footlogoView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0, self.window.frame.size.height-100, self.window.frame.size.width, 100.0)];
    footlogoView.backgroundColor = [UIColor clearColor];
    footlogoView.image = [UIImage imageNamed:@"viewBGLogo"];
    [self.window addSubview:footlogoView];
    
    Curbounds = self.window.bounds;
    arrImages = [NSArray arrayWithObjects:@"imageGuide1.png",@"imageGuide2.png",@"imageGuide3.png", nil];
    [UIApplication sharedApplication].statusBarHidden = YES;
    
    //
    myscrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0,0.0, Curbounds.size.width, Curbounds.size.height)];
    myscrollView.backgroundColor = [UIColor clearColor];
    myscrollView.pagingEnabled =YES;
    myscrollView.scrollEnabled = YES;
    myscrollView.userInteractionEnabled = YES;
    myscrollView.showsVerticalScrollIndicator = NO;
    myscrollView.showsHorizontalScrollIndicator = NO;
    myscrollView.delegate = self;
    myscrollView.contentSize = CGSizeMake(Curbounds.size.width*[arrImages count],Curbounds.size.height);
    [self.window addSubview:myscrollView];
    [self loadScrollView];
    
    
}

#pragma mark-
-(void)loadScrollView
{
    for (int i=0; i<[arrImages count]; i++) {
        
        //
        UIImageView *tempImageView = [[UIImageView alloc] initWithFrame:CGRectMake(Curbounds.size.width*i,0 , Curbounds.size.width, Curbounds.size.height-5)];
        [tempImageView setImage:[UIImage imageNamed:[arrImages objectAtIndex:i]]];
        tempImageView.tag = 100+i;
        tempImageView.userInteractionEnabled = YES;
        [myscrollView addSubview:tempImageView];
        
        
        //
        if (i == [arrImages count]-1) {
            UIButton *removeBut = [[UIButton alloc] initWithFrame:CGRectMake((self.window.bounds.size.width - 75.0) / 2.0, 410, 75.0, 34)];
            [removeBut setBackgroundImage:[UIImage imageNamed:@"imgTipsViewUnClicked@2x.jpg"] forState:UIControlStateNormal];
            removeBut.backgroundColor = [UIColor clearColor];
            
            [removeBut addTarget:self action:@selector(clickRemoveBut:) forControlEvents:UIControlEventTouchUpInside];
            removeBut.showsTouchWhenHighlighted = YES;
            
            [tempImageView addSubview:removeBut];
            
            if (iPhone5) {
                
                removeBut.frame = CGRectMake((self.window.bounds.size.width - 75.0) / 2.0, 500.0, 75.0, 34.0);
                
            }
            
        }
        
    }
}

#pragma mark--
#pragma mark---退出功能介绍
-(void)clickRemoveBut:(UIButton*)btn
{
    
    [btn setBackgroundImage:[UIImage imageNamed:@"imgTipsViewClicked"] forState:UIControlStateNormal];
    
    [UIApplication sharedApplication].statusBarHidden = NO;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.75];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [myscrollView setAlpha:0.0];
    
    for(UIImageView *im in self.window.subviews)
    {
        if(im!=nil && im.tag == 101)
        {
            [im removeFromSuperview];
        }
    }
    
    [headlogoView removeFromSuperview];
    
    [footlogoView removeFromSuperview];
    
    [myscrollView removeFromSuperview];
    myscrollView = nil;
    [myPageControl removeFromSuperview];
    myPageControl = nil;
    
    [UIView commitAnimations];

    [self firstVC];

    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstStart"];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self showRootViewController];
    
}

-(void)firstVC{
    MSIdenViewController *iden = [[MSIdenViewController alloc]init];
    self.window.rootViewController = iden;

}

-(void)showRootViewController
{

    self.mainVC = [self fetchTabbarController];
    self.window.rootViewController = self.mainVC;
}


- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [UMSocialSnsService handleOpenURL:url];
}
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return  [UMSocialSnsService handleOpenURL:url];
}

- (void)applicationWillResignActive:(UIApplication *)application
{

    
}
//进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application
{

//    [[EaseMob sharedInstance] applicationDidEnterBackground:application];
}
//将要从后台返回
- (void)applicationWillEnterForeground:(UIApplication *)application
{
 
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}
//申请处理时间
- (void)applicationWillTerminate:(UIApplication *)application
{
//    [[EaseMob sharedInstance] applicationWillTerminate:application];
}

@end
