//
//  MainViewController.h
//  DaBan
//
//  Created by qkm on 15-7-30.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSMyViewController.h"

@interface MainViewController : UITabBarController
//{
//    EMConnectionState _connectionState;
//}
@property (nonatomic, strong) MSMyViewController *myVC;
- (void)jumpToChatList;
//设置未处理的申请.
//- (void)setupUntreatedApplyCount;
//- (void)networkChanged:(EMConnectionState)connectionState;
@end
