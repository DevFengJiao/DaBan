//
//  MainViewController.m
//  DaBan
//
//  Created by qkm on 15-7-30.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (strong, nonatomic) NSDate *lastPlaySoundDate;
@end

@implementation MainViewController

#pragma mark - *** 类的创建 ***

#pragma mark - *** init and 数据源  ***

#pragma mark - *** UIView的生命周期  ***

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


///**
// *  消息 好友变化 群主变化, 登录状态 自动登录 CallManagerDelegate.
// */
//
////两次提示的默认间隔 震动响铃的时间
//static const CGFloat kDefaultPlaySoundInterval = 3.0;

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"领游";
    
//    [self registerNotifications];
//    [self loadNotificationObserver];
//    [self setupUntreatedApplyCount];
//    [self setupUnreadMessageCount];
    
}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//
//#pragma mark - *** 数据的处理 ***
//
//#pragma mark - // 统计未读消息数 //
///*
//// 统计未读消息数
//-(void)setupUnreadMessageCount
//{
//    NSArray *conversations = [[[EaseMob sharedInstance] chatManager] conversations];
//    NSInteger unreadCount = 0;
//    for (EMConversation *conversation in conversations) {
//        unreadCount += conversation.unreadMessagesCount;
//    }
////    if (_chatListVC) {
////        if (unreadCount > 0) {
////            _chatListVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%i",(int)unreadCount];
////        }else{
////            _chatListVC.tabBarItem.badgeValue = nil;
////        }
////    }
//    
//    UIApplication *application = [UIApplication sharedApplication];
//    [application setApplicationIconBadgeNumber:unreadCount];
//}
//
//
//- (void)setupUntreatedApplyCount
//{
////    NSInteger unreadCount = [[[ApplyViewController shareController] dataSource] count];
////    if (_chatListVC) {
////        if (unreadCount > 0) {
////            _chatListVC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%i",(int)unreadCount];
////        }else{
////            _chatListVC.tabBarItem.badgeValue = nil;
////        }
////    }
//}
//
//
//#pragma mark - *** UI布局 ***
//
//#pragma mark - *** UI 更新 ***
//
//#pragma mark - *** action ***
//
//- (void)networkChanged:(EMConnectionState)connectionState
//{
//    _connectionState = connectionState;
//   // [_chatListVC networkChanged:connectionState];
//}
//
//#pragma mark - public
//
//- (void)jumpToChatList
//{
////    if(_chatListVC)
////    {
////        [self.navigationController popToViewController:self animated:NO];
////        [self setSelectedViewController:_chatListVC];
////    }
//    
//}
//
//#pragma mark - *** 代理 ***
//
//
//// 未读消息数量变化回调
//- (void)didUnreadMessagesCountChanged
//{
//    [self setupUnreadMessageCount];
//}
//
//#pragma mark -  已经接收离线消息
//- (void)didFinishedReceiveOfflineMessages:(NSArray *)offlineMessages
//{
//    [self setupUnreadMessageCount];
//}
//
////传透消息.
//- (void)didFinishedReceiveOfflineCmdMessages:(NSArray *)offlineCmdMessages
//{
//    
//}
//
//#pragma mark - 收到消息
//
////是否显示通知. 已屏蔽接收推送消息的群ID列表不显示通知.
//- (BOOL)needShowNotification:(NSString *)fromChatter
//{
//    BOOL ret = YES;
//    NSArray *igGroupIds = [[EaseMob sharedInstance].chatManager ignoredGroupIds];
//    for (NSString *str in igGroupIds) {
//        if ([str isEqualToString:fromChatter]) {
//            ret = NO;
//            break;
//        }
//    }
//    
//    return ret;
//}
//
//#pragma mark - // 接收到消息. //
//- (void)didReceiveMessage:(EMMessage *)message
//{
//    
//    BOOL needShowNotification = message.isGroup ? [self needShowNotification:message.conversationChatter] : YES;
//    if (needShowNotification) {
//#if !TARGET_IPHONE_SIMULATOR
//        
//        BOOL isAppActivity = [[UIApplication sharedApplication] applicationState] == UIApplicationStateActive;
//        if (!isAppActivity) {
//            [self showNotificationWithMessage:message];
//        }else {
//            [self playSoundAndVibration];
//        }
//#endif
//    }
//    
//}
//
//#pragma mark  - // 震动和响铃.
//
//- (void)playSoundAndVibration{
//    NSTimeInterval timeInterval = [[NSDate date]
//                                   timeIntervalSinceDate:self.lastPlaySoundDate];
//    if (timeInterval < kDefaultPlaySoundInterval) {
//        //如果距离上次响铃和震动时间太短, 则跳过响铃
//        NSLog(@"//环信:距离上次响铃和震动时间太短, 则跳过响铃 正在的时间%@, 上一次的时间%@", [NSDate date], self.lastPlaySoundDate);
//        return;
//    }
//    
//    //保存最后一次响铃时间
//    self.lastPlaySoundDate = [NSDate date];
//    
//    // 收到消息时，播放音频
//    [[EaseMob sharedInstance].deviceManager asyncPlayNewMessageSound];
//    // 收到消息时，震动
//    [[EaseMob sharedInstance].deviceManager asyncPlayVibration];
//}
//
//
//
//#pragma mark - IChatManagerDelegate //登陆回调（主要用于监听自动登录是否成功）//
//
//#pragma mark - //用户登录后的回调//
//
//#pragma mark - IChatManagerDelegate 消息变化
//
//- (void)didUpdateConversationList:(NSArray *)conversationList
//{
//    
//    [self setupUnreadMessageCount];
//    NSLog(@"------------------- didUpdateConversationList 已经更新了会话列表. -------------------");
//   // [_chatListVC refreshDataSource];
//}
////
//- (void)didAutoLoginWithInfo:(NSDictionary *)loginInfo error:(EMError *)error
//{
//    
//    NSLog(@"------------------- MainVC 自动登录结束-------------------");
//    
//    if (!error) {
//        NSLog(@"------------------- *********** MainVC 自动登录成功 *********** -------------------");
//       // [self.chatListVC refreshDataSource];
//    }
//    else
//    {
//        NSLog(@"------------------- MainVC 自动登录失败-------------------");
//    }
//}
//
//
////异步登录的不执行.
//- (void)didLoginWithInfo:(NSDictionary *)loginInfo error:(EMError *)error
//{
//    NSLog(@"------------------- 环信用户登录后的回调-------------------");
//    
//    if (error) {
//        /*
//         NSString *hintText = NSLocalizedString(@"你的账号登录失败，正在重试中... \n点击 '登出' 按钮跳转到登录页面 \n点击 '继续等待' 按钮等待重连成功", @"Fail to log in your account, is try again... \nclick 'logout' button to jump to the login page \nclick 'continue to wait for' button for reconnection successful");
//         UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"提示", @"Prompt")
//         message:hintText
//         delegate:self
//         cancelButtonTitle:NSLocalizedString(@"继续等待...", @"continue to wait")
//         otherButtonTitles:NSLocalizedString(@"登出", @"Logout"),
//         nil];
//         alertView.tag = 99;
//         [alertView show];
//         */
//      //  [_chatListVC isConnect:NO];
//        
//    }
//    else
//    {
//        //[self.chatListVC refreshDataSource];
//    }
//}
//
//#pragma mark - UIAlertViewDelegate //(自动登录监听,)//
//
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    //登陆回调（主要用于监听自动登录是否成功
//    if (alertView.tag == 99) {
//        if (buttonIndex != [alertView cancelButtonIndex]) {
//            //异步方法, 注销当前登录用户
//            [[EaseMob sharedInstance].chatManager asyncLogoffWithUnbindDeviceToken:YES completion:^(NSDictionary *info, EMError *error) {
//               // [[ApplyViewController shareController] clear];
//                [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
//            } onQueue:nil];
//        }
//    }
//    //在其他设备登录的状态.
//    else if (alertView.tag == 100) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
//        //当前登录账号已经被从服务器端删除
//    } else if (alertView.tag == 101) {
//        [[NSNotificationCenter defaultCenter] postNotificationName:KNOTIFICATION_LOGINCHANGE object:@NO];
//    }
//}
//
//
//#pragma mark - IChatManagerDelegate 登录状态变化
//
//#pragma mark - // 当前登录账号在其它设备登录时的通知回调 //
//
//- (void)didLoginFromOtherDevice
//{
//    NSLog(@"------------------- 你的账号已在其他地方登录 -------------------");
//    
//    
//    [[EaseMob sharedInstance].chatManager asyncLogoffWithUnbindDeviceToken:NO completion:^(NSDictionary *info, EMError *error) {
//        
//        UIAlertView *alertView =
//        [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"警告", @"Prompt")
//                                   message:NSLocalizedString(@"你的账号已在其他地方登录", @"your login account has been in other places")
//                                  delegate:self
//                         cancelButtonTitle:NSLocalizedString(@"确认", @"OK")
//                         otherButtonTitles:nil, nil];
//        alertView.tag = 100;
//        [alertView show];
//        NSLog(@"info:%@  error:%@",info,error.description);
//        
//    } onQueue:nil];
//    
//    
//    
//}
//
//#pragma mark -  //当前登录账号已经被从服务器端删除//
//
//
//- (void)didRemovedFromServer
//{
//    NSLog(@"------------------- 当你的账号已被从服务器端移除 -------------------");
//    
//    [[EaseMob sharedInstance].chatManager asyncLogoffWithUnbindDeviceToken:NO completion:^(NSDictionary *info, EMError *error) {
//        //     UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"prompt", @"Prompt") message:NSLocalizedString(@"当你的账号已被从服务器端移除", @"your account has been removed from the server side") delegate:self cancelButtonTitle:NSLocalizedString(@"确认", @"OK") otherButtonTitles:nil, nil];
//        //     alertView.tag = 101;
//        //     [alertView show];
//    } onQueue:nil];
//    
//}
//
//
//#pragma mark -  重新连接提示. 自动登录回调
//
//
//- (void)willAutoReconnect{
//    //[self hideHud];
//    //[self showHint:NSLocalizedString(@"正在重连中...", @"reconnecting...")];
//    NSLog(@"环信自动登录中....");
//    
//    NSLog(@"-------------------正在自动重连-------------------");
//    
//    
//}
//
//- (void)didAutoReconnectFinishedWithError:(NSError *)error{
//    NSLog(@"-------------------自动重连结束-------------------");
//   // [self hideHud];
//    if (error) {
//        //[self showHint:NSLocalizedString(@"重连失败，稍候将继续重连", @"reconnection failure, later will continue to reconnection")];
//        NSLog(@"------------------- 环信自动登录..重连失败，稍候将继续重连 -------------------");
//        
//    }else{
//        //[self showHint:NSLocalizedString(@"重连成功！", @"reconnection successful！")];
//        NSLog(@"------------------- 环信 *********** 重新连接成功 ! *********** -------------------");
//        
////        [self.chatListVC requestAllInfo];
////        [self.chatListVC refreshDataSource];
////        
//    }
//}
//
//
//
//
//#pragma mark - IChatManagerDelegate //好友变化//
//
//#pragma mark - //接收到好友请求时的通知 别人发给我的//
///*
// - (void)didReceiveBuddyRequest:(NSString *)username
// message:(NSString *)message
// {
// #if !TARGET_IPHONE_SIMULATOR
// [self playSoundAndVibration];
// 
// BOOL isAppActivity = [[UIApplication sharedApplication] applicationState] == UIApplicationStateActive;
// if (!isAppActivity) {
// //发送本地推送
// UILocalNotification *notification = [[UILocalNotification alloc] init];
// notification.fireDate = [NSDate date]; //触发通知的时间
// notification.alertBody = [NSString stringWithFormat:NSLocalizedString(@"%@ 添加你为好友", @"%@ add you as a friend"), username];
// notification.alertAction = NSLocalizedString(@"打开", @"Open");
// notification.timeZone = [NSTimeZone defaultTimeZone];
// notification.soundName = UILocalNotificationDefaultSoundName;
// //发送通知
// [[UIApplication sharedApplication] scheduleLocalNotification:notification];
// //    UIApplication *application = [UIApplication sharedApplication];
// //    application.applicationIconBadgeNumber += 1;
// }
// #endif
// 
// //[self.chatListVC.contactsVC reloadApplyView];
// }
// 
// */
//
//#pragma mark - 已经更新了好友列表. //通讯录信息发生变化时的通知//
//- (void)didUpdateBuddyList:(NSArray *)buddyList
//            changedBuddies:(NSArray *)changedBuddies
//                     isAdd:(BOOL)isAdd
//{
//    /*
//     //(YES为新添加好友, NO为删除好友)
//     if (!isAdd)
//     {
//     //删除的好友.
//     NSMutableArray *deletedBuddies = [NSMutableArray array];
//     for (EMBuddy *buddy in changedBuddies)
//     {
//     [deletedBuddies addObject:buddy.username];
//     }
//     [[EaseMob sharedInstance].chatManager removeConversationsByChatters:deletedBuddies deleteMessages:YES append2Chat:YES];
//     [_chatListVC refreshDataSource];
//     
//     
//     }
//     else
//     {
//     }
//     */
//    
//    //[self.chatListVC.contactsVC reloadDataSource];
//}
///**
// *  ///////////////////////////////////////////
// **/
//#pragma mark -- ***********别人发给我的好友请求状态 *****************
//
//#pragma mark -- //接受好友请求  好友请求被接受时的回调 //
////之前发出的好友请求被用户username接受了
///*
// - (void)didAcceptedByBuddy:(NSString *)username
// {
// NSLog(@"*---------didAcceptedByBuddy");
// [self.chatListVC.contactsVC reloadDataSource];
// }
// 
// 
// 
// #pragma mark --   发出的请求被拒绝 //之前发出的好友请求被用户username拒绝了//
// - (void)didRejectedByBuddy:(NSString *)username
// {
// NSString *message = [NSString stringWithFormat:NSLocalizedString(@"你被'%@'无耻的拒绝了", @"you are shameless refused by '%@'"), username];
// TTAlertNoTitle(message);
// }
// 
// */
//#pragma mark - //删除好友的通知//  登录的用户被好友从列表中删除了
//- (void)didRemovedByBuddy:(NSString *)username
//{
//    [[EaseMob sharedInstance].chatManager removeConversationByChatter:username deleteMessages:YES append2Chat:YES];
//    NSLog(@"didRemovedByBuddy");
////    [_chatListVC refreshDataSource];
////    [self.chatListVC.contactsVC reloadDataSource];
//}
//
//
//
//#pragma mark - IChatManagerDelegate 群组变化
//
//#pragma mark -  //收到了其它群组的加入邀请//
///*
// - (void)didReceiveGroupInvitationFrom:(NSString *)groupId
// inviter:(NSString *)username
// message:(NSString *)message
// {
// #if !TARGET_IPHONE_SIMULATOR
// [self playSoundAndVibration];
// #endif
// 
// [self.chatListVC.contactsVC reloadGroupView];
// }
// 
// //接收到入群申请(还没同意);
// - (void)didReceiveApplyToJoinGroup:(NSString *)groupId
// groupname:(NSString *)groupname
// applyUsername:(NSString *)username
// reason:(NSString *)reason
// error:(EMError *)error
// {
// if (!error) {
// #if !TARGET_IPHONE_SIMULATOR
// [self playSoundAndVibration];
// #endif
// 
// [self.chatListVC.contactsVC reloadGroupView];
// }
// }
// 
// //申请加入群组，同意后的回调 接受入群.
// - (void)didReceiveAcceptApplyToJoinGroup:(NSString *)groupId
// groupname:(NSString *)groupname
// {
// NSString *message = [NSString stringWithFormat:NSLocalizedString(@"你同意加入\'%@\'", @"agreed to join the group of \'%@\'"), groupname];
// [self showHint:message];
// }
// 
// //邀请别人加入群组, 但被别人拒绝后的回调
// - (void)didReceiveGroupRejectFrom:(NSString *)groupId
// invitee:(NSString *)username
// reason:(NSString *)reason
// {
// NSString *message = [NSString stringWithFormat:NSLocalizedString(@"'%@'拒绝加入'%@'", @""), username,groupId];
// TTAlertNoTitle(message);
// }
// */
//
//#pragma mark - ICallManagerDelegate  (语音电话代理 本类主要处理实时通话 )
//
//#pragma mark - ( 实时通话状态发生变化时的回调  )
//- (void)callSessionStatusChanged:(EMCallSession *)callSession changeReason:(EMCallStatusChangedReason)reason error:(EMError *)error
//{
//    if (callSession.status == eCallSessionStatusConnected)
//    {
//        EMError *error = nil;
//        BOOL isShowPicker = [[[NSUserDefaults standardUserDefaults] objectForKey:@"isShowPicker"] boolValue];
//        
//        //#warning 在后台不能进行视频通话
//        if(callSession.type == eCallSessionTypeVideo && [[UIApplication sharedApplication] applicationState] == UIApplicationStateBackground){
//            error = [EMError errorWithCode:EMErrorInitFailure andDescription:@"后台不能进行视频通话"];
//        }
//        else if (!isShowPicker){
//            [[EMSDKFull sharedInstance].callManager removeDelegate:self];
//            //            _callController = nil;
////            CallViewController *callController = [[CallViewController alloc] initWithSession:callSession isIncoming:YES];
////            callController.modalPresentationStyle = UIModalPresentationOverFullScreen;
////            //            _callController = callController;
////            [self presentViewController:callController animated:NO completion:nil];
//        }
//        
//        if (error || isShowPicker) {
//            //Hangup 挂起.
//            [[EMSDKFull sharedInstance].callManager asyncEndCall:callSession.sessionId reason:eCallReason_Hangup];
//        }
//    }
//    else if (callSession.status == eCallSessionStatusAccepted)
//    {
//        NSLog(@"环信: 接受实时通话!");
//    }
//}
//
//#pragma mark - *** KVO 和 通知 ***
//
//
//#pragma mark -  显示推送通知.
//- (void)showNotificationWithMessage:(EMMessage *)message
//{
//    EMPushNotificationOptions *options = [[EaseMob sharedInstance].chatManager pushNotificationOptions];
//    //发送本地推送
//    __block UILocalNotification *notification = [[UILocalNotification alloc] init];
//    
//    //推送消息显示的类型
//    if (options.displayStyle == ePushNotificationDisplayStyle_messageSummary) {
//        id<IEMMessageBody> messageBody = [message.messageBodies firstObject];
//        NSString *messageStr = nil;
//        switch (messageBody.messageBodyType) {
//            case eMessageBodyType_Text:
//            {
//                messageStr = ((EMTextMessageBody *)messageBody).text;
//            }
//                break;
//            case eMessageBodyType_Image:
//            {
//                messageStr = NSLocalizedString(@"图片", @"Image");
//            }
//                break;
//            case eMessageBodyType_Location:
//            {
//                messageStr = NSLocalizedString(@"位置", @"Location");
//            }
//                break;
//            case eMessageBodyType_Voice:
//            {
//                messageStr = NSLocalizedString(@"语音", @"Voice");
//            }
//                break;
//            case eMessageBodyType_Video:{
//                messageStr = NSLocalizedString(@"视频", @"Vidio");
//            }
//                break;
//            default:
//                break;
//        }
//        //消息来源用户名
//        __block  NSString *title = message.from;
//        NSString *groupName = nil;
//        if (message.isGroup) {
//            NSArray *groupArray = [[EaseMob sharedInstance].chatManager groupList];
//            
//            for (EMGroup *group in groupArray) {
//                if ([group.groupId isEqualToString:message.conversationChatter]) {
//                    //群聊消息里的发送者用户名  和 群主题(名字)
//                    groupName = group.groupSubject;
//                    break;
//                }
//            }
//            
//            
//        }
//        if ([[MKChatManager sharedInstance] isRequestChatterWithId:message.groupSenderName]) {
//            FriendsModel *model = [[MKChatManager sharedInstance].chattersDictionary objectForKey:message.groupSenderName];
//            //
//            NSString *userName = model.userId;
//            if (model.userName && model.userName.length > 0) {
//                userName = model.userName;
//            }
//            
//            if (message.isGroup) {
//                title = [NSString stringWithFormat:@"%@(%@)",userName,groupName];
//            }
//            else
//            {
//                title = userName;
//            }
//            
//            notification.fireDate = [NSDate date]; //触发通知的时间
//            
//            notification.alertBody = [NSString stringWithFormat:@"%@:%@", title, messageStr];
//            
//            notification.alertBody = [[NSString alloc] initWithFormat:@"[本地]%@", notification.alertBody];
//            
//            
//            notification.alertAction = NSLocalizedString(@"打开", @"Open");
//            notification.timeZone = [NSTimeZone defaultTimeZone];
//            notification.soundName = UILocalNotificationDefaultSoundName;
//            //发送通知
//            [[UIApplication sharedApplication] scheduleLocalNotification:notification];
//        }
//        else {
//            NSDictionary *dict = @{@"id":message.groupSenderName};
////            [MKHttpRequest requestWithAction:@"GET_USERICON"
////                                  parameters:dict
////                                      option:MKRequestCenterCachePolicyCacheElseWeb
////                                    finished:^(NSURLResponse *response, NSData *data, id JSONObject) {
////                                        NSDictionary *result = [JSONObject objectForKey:@"result"];
////                                        if (result) {
////                                            NSString *avatarUrl = [result objectForKey:@"icon2"];
////                                            NSString *nickName = [result objectForKey:@"userName"];
////                                            
////                                            FriendsModel *model = [[FriendsModel alloc] init];
////                                            model.userId = message.groupSenderName;
////                                            model.icon = avatarUrl;
////                                            model.userName = nickName;
////                                            
////                                            NSString *userName = model.userId;
////                                            if (model.userName && model.userName.length > 0) {
////                                                userName = model.userName;
////                                            }
////                                            
////                                            if (message.isGroup) {
////                                                title = [NSString stringWithFormat:@"%@(%@)",userName,groupName];
////                                            }
////                                            else
////                                            {
////                                                title = userName;
////                                            }
////                                            
////                                            notification.fireDate = [NSDate date]; //触发通知的时间
////                                            
////                                            notification.alertBody = [NSString stringWithFormat:@"%@:%@", title, messageStr];
////                                            
////                                            notification.alertBody = [[NSString alloc] initWithFormat:@"[本地]%@", notification.alertBody];
////                                            
////                                            
////                                            notification.alertAction = NSLocalizedString(@"打开", @"Open");
////                                            notification.timeZone = [NSTimeZone defaultTimeZone];
////                                            notification.soundName = UILocalNotificationDefaultSoundName;
////                                            //发送通知
////                                            [[UIApplication sharedApplication] scheduleLocalNotification:notification];
////                                            
////                                            
////                                        }
////                                    } failed:^(NSURLResponse *response, NSError *error) {
////                                        
////                                    }];
////        }
////        
////    }
////    else{
////        notification.alertBody = NSLocalizedString(@"您有一条新消息", @"you have a new message");
////#warning 去掉注释会显示[本地]开头, 方便在开发中区分是否为本地推送
////        notification.alertBody = [[NSString alloc] initWithFormat:@"[本地]%@", notification.alertBody];
////        
////        notification.alertAction = NSLocalizedString(@"打开", @"Open");
////        notification.timeZone = [NSTimeZone defaultTimeZone];
////        notification.soundName = UILocalNotificationDefaultSoundName;
////        //发送通知
////        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
////    }
////    
////    
//    
//    //    UIApplication *application = [UIApplication sharedApplication];
//    //    application.applicationIconBadgeNumber += 1;
// }
//}
//
//#pragma mark - 通知注册.
//
////-(void)registerNotifications
////{
////    [self unregisterNotifications];
////    
////    [[EaseMob sharedInstance].chatManager addDelegate:self delegateQueue:nil];
////    [[EMSDKFull sharedInstance].callManager addDelegate:self delegateQueue:nil];
////}
//
////-(void)unregisterNotifications
////{
////    [[EaseMob sharedInstance].chatManager removeDelegate:self];
////    [[EMSDKFull sharedInstance].callManager removeDelegate:self];
////}
//
////- (void)loadNotificationObserver
////{
////    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setupUntreatedApplyCount) name:@"setupUntreatedApplyCount" object:nil];
////    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callOutWithChatter:) name:@"callOutWithChatter" object:nil];
////    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(callControllerClose:) name:@"callControllerClose" object:nil];
////}
//
//#pragma mark --  唤出时时语音 视频
//
////- (void)callOutWithChatter:(NSNotification *)notification
////{
////    id object = notification.object;
////    if ([object isKindOfClass:[NSDictionary class]]) {
////        EMError *error = nil;
////        NSString *chatter = [object objectForKey:@"chatter"];
////        EMCallSessionType type = [[object objectForKey:@"type"] intValue];
////        EMCallSession *callSession = nil;
////        if (type == eCallSessionTypeAudio) {
////            callSession = [[EMSDKFull sharedInstance].callManager asyncMakeVoiceCall:chatter timeout:50 error:&error];
////        }
////        else if (type == eCallSessionTypeVideo){
////            callSession = [[EMSDKFull sharedInstance].callManager asyncMakeVideoCall:chatter timeout:50 error:&error];
////        }
////        
////        if (callSession && !error) {
////            [[EMSDKFull sharedInstance].callManager removeDelegate:self];
////            
////            //            _callController = nil;
////            CallViewController *callController = [[CallViewController alloc] initWithSession:callSession isIncoming:NO];
////            callController.modalPresentationStyle = UIModalPresentationOverFullScreen;
////            //            _callController = callController;
////            [self presentViewController:callController animated:NO completion:nil];
////        }
////        
////        if (error) {
////            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"通话错误", @"error") message:error.description delegate:nil cancelButtonTitle:NSLocalizedString(@"离开", @"OK") otherButtonTitles:nil, nil];
////            [alertView show];
////        }
////    }
//}
////#pragma mark --  结束时时语音 视频
////- (void)callControllerClose:(NSNotification *)notification
////{
////    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
////    [audioSession setCategory:AVAudioSessionCategoryPlayback error:nil];
////    [audioSession setActive:YES error:nil];
////    
////    [[EMSDKFull sharedInstance].callManager addDelegate:self delegateQueue:nil];
////}
//
//*/
//
@end
