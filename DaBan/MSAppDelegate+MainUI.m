//
//  MSAppDelegate+MainUI.m
//  DaBan
//
//  Created by qkm on 15-7-30.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSAppDelegate+MainUI.h"
#import "BaseNavigationController.h"
#import "Colours.h"
#import "MSActivityViewController.h"
#import "MSChatListViewController.h"

#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)


@implementation MSAppDelegate (MainUI)

- (MainViewController *)fetchTabbarController
{
    [self appAppearanceConfig];
    
    MainViewController *mainVC = [[MainViewController alloc] init];
    //避免ListVC为空./
    self.mainVC = mainVC;
    mainVC.viewControllers = [self fetchAllViewController];
    
    return mainVC;
}


- (NSMutableArray *)fetchAllViewController
{
    NSMutableArray *titleArray = [NSMutableArray arrayWithObjects:@"",@"",nil];
    NSArray *imageArray = @[@"tabbar1",@"tabbar2",@"tabbar3"];
    NSArray *selectImageArray = @[@"tabbarS1",@"tabbarS2",@"tabbarS3",];
    NSMutableArray *classArray = [NSMutableArray arrayWithArray: @[@"MSActivityViewController",@"MSChatListViewController"]];
    
    if (1) {
        [titleArray addObject:@""];
   
//        [classArray addObject:@"MSTravelViewController"];
        [classArray addObject:@"MSMyViewController"];
    }else
    {
        NSLog(@"MainUI:USERID :%@",USERID);
        [titleArray addObject:@""];
        [classArray addObject:@"LoginViewController"];
        [classArray addObject:@"LoginViewController"];
    }
    
    NSMutableArray* viewControllers = [NSMutableArray array];
    NSInteger i = 0;
    for (NSString *className in classArray) {
        Class class = NSClassFromString(className);
        if (class) {
            MSBeseViewController *rvc = [[class alloc] init];
//            
//            if ( [rvc isKindOfClass:[MSMyViewController class]]) {
//                self.mainVC.myVC = (MSMyViewController *) rvc;
//                UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:rvc];
//                [viewControllers addObject:nc];
//            }
//            else
//            {
                BaseNavigationController *nc = [[BaseNavigationController alloc] initWithRootViewController:rvc];
                [viewControllers addObject:nc];
//            }
            
            
//            rvc.title = titleArray[i]; //此方法会影响 NavigationItem 的 setTitle方法.
            
            //工具栏的属性
            if (SYSTEM_VERSION_LESS_THAN(@"7.0")) {
                UIImage *normalImage = [UIImage imageNamed:imageArray[i]];
                UIImage *selectImage = [UIImage imageNamed:selectImageArray[i]];
                [rvc.tabBarItem setFinishedSelectedImage:selectImage withFinishedUnselectedImage:normalImage];
                rvc.tabBarItem.title = titleArray[i];
                UIColor *selectColor = APP_COLOR;
                rvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:nil tag:i+1000];
                [rvc.tabBarItem setFinishedSelectedImage:selectImage withFinishedUnselectedImage:normalImage];
                
                //设置图片的偏移量
                rvc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
                [rvc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                   [UIColor clearColor], UITextAttributeTextColor,
                                                                   nil] forState:UIControlStateNormal];
                [rvc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                        selectColor, NSForegroundColorAttributeName,
                                                        nil] forState:UIControlStateHighlighted];
            }
            else
            {
                
                UIImage *normalImage = [[UIImage imageNamed:imageArray[i]]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                UIImage *selectImage = [[UIImage imageNamed:selectImageArray[i]]  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                UIColor *selectColor = [UIColor clearColor];
                rvc.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:normalImage selectedImage:selectImage];
                rvc.tabBarItem.tag = i + 1000;
                //设置图片的偏移量
                rvc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
                
                //隐藏字体
                [rvc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                   [UIColor clearColor], UITextAttributeTextColor,
                                                                   nil] forState:UIControlStateNormal];//显示的时候可以修改字体的颜色
                [rvc.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                        selectColor, NSForegroundColorAttributeName,
                                                        nil] forState:UIControlStateHighlighted];
            }
        }
        i++;
    }
    return viewControllers;
}
-(void)appAppearanceConfig
{
    //GLOBAL APPEARANCE CONFIG
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    {
        //设置导航栏的背影颜色
        [[UINavigationBar appearance] setBarTintColor:APP_NACOLOR];
        //定制返回按钮的颜色  图片的颜色是由tintColor属性控制的。
        [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
      
        NSDictionary * dict = [NSDictionary dictionaryWithObject:ZI_NACOLOR forKey:NSForegroundColorAttributeName];
        [[UINavigationBar appearance] setTitleTextAttributes:dict];
        [[UITableViewCell appearance] setTintColor:RED_COLOR];
        
        
        
//        if ([UINavigationBar instancesRespondToSelector:@selector(setBackIndicatorImage:)])
//        {
//            // iOS 7
//            UIEdgeInsets insets = UIEdgeInsetsMake(0, 5, 5, 5);
//            //导航栏左边返回的按钮
//            [[UINavigationBar appearance] setBackIndicatorImage:[[[UIImage imageNamed:@"01-2返回.png"] imageWithAlignmentRectInsets:insets] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//            [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:[[[UIImage imageNamed:@"01-2返回.png"] imageWithAlignmentRectInsets:insets] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] ];
//            [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(5, 0) forBarMetrics:UIBarMetricsDefault]; // Takes out title
//              [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"btn-gray@2x.png"] forBarMetrics:UIBarMetricsDefault];
//        }
//    }
//    else
//    {
//        [[UINavigationBar appearance] setTintColor:APP_COLOR];
//        
//        [[UILabel appearance] setBackgroundColor:[UIColor clearColor]];
//        // [[UITabBar appearance] setSelectedImageTintColor:APP_COLOR];
//        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                           [UIColor colorWithWhite:1 alpha:1.0], NSForegroundColorAttributeName,
//                                                           nil] forState:UIControlStateNormal];
//        UIColor *titleHighlightedColor = [UIColor redColor];
//        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                           titleHighlightedColor, NSForegroundColorAttributeName,
//                                                           nil] forState:UIControlStateSelected];
//        
    }
//    
//    [[UISwitch appearance]setOnTintColor:APP_COLOR];
//    
}




@end
