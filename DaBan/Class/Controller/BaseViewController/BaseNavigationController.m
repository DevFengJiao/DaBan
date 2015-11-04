//
//  BaseNavigationController.m
//  NewLingYou
//
//  Created by zlcs on 15/5/26.
//  Copyright (c) 2015年 Seven. All rights reserved.
//

#import "BaseNavigationController.h"
//#import "MemberInfoViewController.h"
//#import "LoginViewController.h"
@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

//-(void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    self.navigationController.navigationBarHidden = YES;
//}
//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    
//    self.navigationController.navigationBarHidden = NO;
//}



- (void)viewDidLoad {
    [super viewDidLoad];
    //状态栏20个像素的较色
    UIView *statusBarView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_HEIGHT, 20)];
    
    statusBarView.backgroundColor= [UIColor colorWithRed:3/255.0 green:3/255.0 blue:3/255.0 alpha:1.0];
    
    [self.view addSubview:statusBarView];
  
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
  
}
-(void)setNavigationBarHidden:(BOOL)hidden animated:(BOOL)animated{
    
    [super setNavigationBarHidden:hidden animated:animated];
    
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{//
    
//    if ([viewController isKindOfClass:[MemberInfoViewController class]] || [viewController isKindOfClass:[LoginViewController class]]) {
////        [viewController setAutomaticallyAdjustsScrollViewInsets:NO];
//        [super pushViewController:viewController animated:animated];
//        return;
//    }
    
    if (self.viewControllers.count >=1)
    {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated{
    
    return [super popViewControllerAnimated:animated];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

@implementation UIViewController (BaseNavigationController)

- (void)navigationController:(BaseNavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
//    if ([navigationController isKindOfClass:[BaseNavigationController class]] == NO) {
//        return;
//    }
//    
//    UIViewController * targetVC = ([viewController isKindOfClass:[UITabBarController class]])?([(UITabBarController *)viewController selectedViewController]):viewController;
//    
//    if ([viewController isKindOfClass:[UITabBarController class]]) {
//        
//        viewController.navigationItem.leftBarButtonItems = targetVC.navigationItem.leftBarButtonItems;
//        viewController.navigationItem.rightBarButtonItems = targetVC.navigationItem.rightBarButtonItems;
//        viewController.navigationItem.title = targetVC.navigationItem.title;
//        viewController.navigationItem.titleView = targetVC.navigationItem.titleView;
//        
//    }
}
- (void)navigationController:(BaseNavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    
}

@end

