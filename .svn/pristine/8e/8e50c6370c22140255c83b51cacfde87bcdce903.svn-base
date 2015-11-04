//
//  Defines.h
//  LingYou
//
//  Created by Seven on 15/5/18.
//  Copyright (c) 2015年 sky. All rights reserved.
//
/**
 *  Defines.h
 *
 *  @定义 一些宏去处理问题.(多用一些与设备,方法,坐标有关的宏)
 *
 *  @描述 MK代码APP.前缀 (Mate GUKE)
 */
#import <mach/mach_time.h>

//修改系统log，使其在release状态下不输出
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif

//判断空字符串
#define NULL_STR(str)   (str == nil || (NSNull *)str == [NSNull null] || str.length == 0)

#define APP_COLOR [UIColor  colorFromHexString:@"0x309DF0"]  //主色调

#define BACK_GRAY_COLOR20 [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0]

#define APP_NACOLOR [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0]//导航栏颜色

#define BACK_GRAY_COLOR [UIColor colorFromHexString:@"0xeeeeee"]  //灰白调

#define RED_COLOR [UIColor colorWithRed:255/255.0 green:86/255.0 blue:74/255.0 alpha:1.0]

#define ZI_NACOLOR [UIColor colorWithRed:180/255.0 green:180/255.0 blue:180/255.0 alpha:1.0]

#define SHOW_MESSAGE_VIEW(__title, __message, __cancelButtonTitle,__confirmButtonTitle)  { \
UIAlertView* alert = [[UIAlertView alloc] initWithTitle:__title message:__message delegate:nil cancelButtonTitle:__cancelButtonTitle otherButtonTitles:__confirmButtonTitle]; \
[alert show]; \
}

#define SCREEN_WIDTH     ([UIScreen mainScreen].bounds.size.width)//屏幕宽度
#define SCREEN_HEIGHT    ([UIScreen mainScreen].bounds.size.height)//屏幕高


#define APPLICATION_WIDTH        ([UIScreen mainScreen].bounds.size.width)  //屏幕宽度
#define APPLICATION_NO_NAV       ([UIScreen mainScreen].bounds.size.height - 64)  //无导航和状态栏的高度

//是retina屏幕吗
#define MK_ISRETINA    ([UIScreen mainScreen].scale == 2)

//判断系统版本是否低于某个值(字符串类型)
#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

//获得当前版本
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define IOS_VERSION [[UIDevice currentDevice].systemVersion floatValue]

#define IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)

#define IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ? YES : NO)

//定义控件在不同系统版本下偏移量。
#define VIEWOFFSET IOS7 ? 64:0

#define ZIRED   [UIColor colorFromHexString:@"0xf56b58"]
#define ZICOLOR [UIColor colorFromHexString:@"0x333333"]
#define ZIGRAY  [UIColor colorFromHexString:@"0x666666"]
#define LINE9   [UIColor colorFromHexString:@"0x999999"]
#define LINEA   [UIColor colorFromHexString:@"0xaaabac"]
#define LINEE   [UIColor colorFromHexString:@"0xe2e2e2"]
#define LINEC   [UIColor colorFromHexString:@"0xcccccc"]
#define BGVCOLOR [UIColor colorFromHexString:@"0xab78c"]
#define BUTCOLOR [UIColor  colorFromHexString:@"0x309df0"]
#define CELLCOLOR    [UIColor colorFromHexString:@"0xaaaaaa"]
#define WINDOW  [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3]
#define Arial   @"Arial"
#define HelveticaH  @"Helvetica-Bold"
#define Helvetica   @"Helvetica"
#define ZIFOUT12  [UIFont systemFontOfSize:12.0]
#define ZIFOUT14  [UIFont systemFontOfSize:14.0]
#define ZIFOUT16  [UIFont systemFontOfSize:16.0]
#define ROLELAB   [[NSUserDefaults standardUserDefaults]objectForKey:@"rolelab"]


#define CELLHEIGHT  55
#define TABBARHEIGHT self.tabBarController.tabBar.frame.size.height
//比例
#define PROPORTION ([UIScreen mainScreen].bounds.size.width)/320.0f

//判断手机型号.注意模拟器下可能不准确.
#define iPhone3GS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(320, 480), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone4s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1336), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 1920), [[UIScreen mainScreen] currentMode].size) : NO)

//计算代码运行时间, 使用方法举例:
//LY_TIME_DURATION_BEGIN(@"code name")
//....//此处是任意代码
//LY_TIME_DURATION_END//即可打印出上面代码执行时间
#ifdef DEBUG
#define MK_TIME_DURATION_BEGIN(name)        {\
                                            NSString *tdName = [NSString stringWithFormat:@"%@",(name)];\
                                            NSDate *tdBeginDate = [NSDate date];
#define MK_TIME_DURATION_END                NSTimeInterval tdInterval = [[NSDate date]timeIntervalSinceDate:tdBeginDate];\
                                            NSLog(@"\"%@\"的运行时间:%f毫秒",tdName,tdInterval*1000.0f);\
}
#else
#define MK_TIME_DURATION_BEGIN(name)
#define MK_TIME_DURATION_END
#endif