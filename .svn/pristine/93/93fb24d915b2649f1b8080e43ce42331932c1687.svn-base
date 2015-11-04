//
//  MSChatViewController.m
//  DaBan
//
//  Created by qkm on 15-9-15.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSChatViewController.h"
#import "MSChatHeadView.h"
#import "MSChatModel.h"


extern const CFStringRef kUTTypeImage   __OSX_AVAILABLE_STARTING(__MAC_10_4,__IPHONE_3_0);


@interface MSChatViewController ()<UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate,AVIMClientDelegate>
{
    UIImageView *iv;
}
@property (nonatomic, strong) MSChatHeadView  *headView;
@property (nonatomic, strong) MSChatModel    *model;

@property (nonatomic, strong) UIButton  *displayBtn;//最上面的隐藏按钮
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIImagePickerController *imagePicker;
@end

@implementation MSChatViewController


-(void)setTargetClientId:(NSString *)targetClientId{
    _targetClientId = targetClientId;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=[NSString stringWithFormat:@"与 %@ 的对话", self.targetClientId];
    self.view.backgroundColor = LINEE;
    
  
    
//    [self request];
//    [self drawHeadView];
//    [self.view addSubview:self.tableView];


//
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(keyBoardHidden)];
//    [self.view addGestureRecognizer:tap];
    
//    [self tomCreateConversationWithFriends];
    
    
    
}



//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    UITableViewCell *cell=  [super tableView:tableView cellForRowAtIndexPath:indexPath];
//    return cell;
//}

#pragma -mark
#pragma -mark HeadView
-(void)drawHeadView{
    self.displayBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-20, 0, 40, 20)];
    self.displayBtn.backgroundColor = [UIColor whiteColor];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.displayBtn.bounds      byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight    cornerRadii:CGSizeMake(2, 2)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.displayBtn.bounds;
    maskLayer.path = maskPath.CGPath;
    self.displayBtn.layer.mask = maskLayer;
    [self.displayBtn addTarget:self action:@selector(displayBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.displayBtn];
    
    iv = [[UIImageView alloc]initWithFrame:CGRectMake(12.5, 5, 15, 10)];
    iv.backgroundColor = [UIColor clearColor];
    iv.image = [UIImage imageNamed:@"chat_pull"];
    [self.displayBtn addSubview:iv];
    
    self.model = [[MSChatModel alloc]init];
    
    self.headView = [[MSChatHeadView alloc]initWithFrame:CGRectMake(0, -133, SCREEN_WIDTH, 133)];
    self.headView.backgroundColor = [UIColor whiteColor];
    self.model.time = @"今天8:00出发";
    self.model.end = @"南山";
    self.model.start = @"翰林喹非机动车枯井";
    self.model.money = @"99999";
    self.model.headImgs = @[@"http://ac-qgsi8evy.clouddn.com/MqHCKWPS350ux5CkfWdKRKiJddsK2geYIMnsY4lM.jpg",@"http://ac-qgsi8evy.clouddn.com/MqHCKWPS350ux5CkfWdKRKiJddsK2geYIMnsY4lM.jpg",@"http://ac-qgsi8evy.clouddn.com/MqHCKWPS350ux5CkfWdKRKiJddsK2geYIMnsY4lM.jpg"];
    if ([ROLELAB isEqualToString:@"我是车主"]) {
        self.model.type = 1;
    }else{
        self.model.carNumber = @"湘A56452";
        self.model.type = 2;
    }
    self.headView.model = self.model;
    [self.view addSubview:self.headView];
}


-(void)displayBtnClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        [UIView animateWithDuration:0.8 animations:^{
            self.headView.frame = CGRectMake(self.headView.frame.origin.x, self.headView.frame.origin.y+133, self.headView.frame.size.width, self.headView.frame.size.height);
            self.displayBtn.frame = CGRectMake(self.displayBtn.frame.origin.x,self.displayBtn.frame.origin.y+133, self.displayBtn.frame.size.width, self.displayBtn.frame.size.height);
            iv.image = [UIImage imageNamed:@"chat_pull"];
        }];
    }else{
        [UIView animateWithDuration:0.5 animations:^{
            self.headView.frame = CGRectMake(self.headView.frame.origin.x, self.headView.frame.origin.y-133, self.headView.frame.size.width, self.headView.frame.size.height);
            self.displayBtn.frame = CGRectMake(self.displayBtn.frame.origin.x,self.displayBtn.frame.origin.y-133, self.displayBtn.frame.size.width, self.displayBtn.frame.size.height);
            iv.image = [UIImage imageNamed:@"chat_down"];
        }];
    }
}

#pragma -mark


- (void)handleLongPress:(UILongPressGestureRecognizer *)recognizer
{
//    if (recognizer.state == UIGestureRecognizerStateBegan && [self.viewModel.dataSource count] > 0) {
//        CGPoint location = [recognizer locationInView:self.tableView];
//        //通过一个点就能获得索引.indexPath;
//        NSIndexPath * indexPath = [self.tableView indexPathForRowAtPoint:location];
//        id object = [self.viewModel.dataSource objectAtIndex:indexPath.row];
//        if ([object isKindOfClass:[MessageModel class]]) {
//            EMChatViewCell *cell = (EMChatViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
//            [cell becomeFirstResponder];
//            _longPressIndexPath = indexPath;
//            [self showMenuViewController:cell.bubbleView andIndexPath:indexPath messageType:cell.messageModel.type];
//        }
//    }
}

//- (UITableView *)tableView
//{
//    if (_tableView == nil) {
//        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - self.chatToolBar.frame.size.height) style:UITableViewStylePlain];
//        _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
//        _tableView.delegate = self;
//        _tableView.dataSource = self;
//        _tableView.backgroundColor = [UIColor clearColor];
////        _tableView.tableFooterView = [[UIView alloc] init];
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//        
//        UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
//        lpgr.minimumPressDuration = .5;
//        [_tableView addGestureRecognizer:lpgr];
//    }
//    
//    return _tableView;
//}
- (void)scrollViewToBottom:(BOOL)animated
{
    if (self.tableView.contentSize.height > self.tableView.frame.size.height)
    {
        CGPoint offset = CGPointMake(0, self.tableView.contentSize.height - self.tableView.frame.size.height);
        [self.tableView setContentOffset:offset animated:animated];
    }
}



-(void)request{
    NSURL *url4 = [NSURL URLWithString:[NSString stringWithFormat:@"%@user/me/get?token=%@",DaBan_URL,[self url]]];
    
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
        
        if ([[result objectForKey:@"retcode"]intValue] == 0) {
            
            NSString *tem = result[@"data"];
            NSData* myData=[tem dataUsingEncoding:NSUTF8StringEncoding];
            
            id dictionary2 = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingAllowFragments error:nil];
            
//            self.model = [[MSChatModel alloc]initWithDictionary:dictionary2];
            
            
        }
    }
    
//    [self drawHeadView];
}

//- (DXMessageToolBar *)chatToolBar
//{
//    if (_chatToolBar == nil) {
//        _chatToolBar = [[DXMessageToolBar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - [DXMessageToolBar defaultHeight], self.view.frame.size.width, [DXMessageToolBar defaultHeight])];
//        _chatToolBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin;
//        _chatToolBar.delegate = self;
//        
//        //暂时不支持时时通话..故...
//        //ChatMoreType type = self.viewModel.isGroup == YES ? ChatMoreTypeGroupChat : ChatMoreTypeChat;
//        ChatMoreType type = ChatMoreTypeGroupChat;
//        _chatToolBar.moreView = [[DXChatBarMoreView alloc] initWithFrame:CGRectMake(0, (kVerticalPadding * 2 + kInputTextViewMinHeight), _chatToolBar.frame.size.width, 80) typw:type];
//        _chatToolBar.moreView.backgroundColor = MK_RGBACOLOR(240, 242, 247, 1);
//        _chatToolBar.moreView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
//    }
//    
//    return _chatToolBar;
//}

// 点击背景隐藏
//-(void)keyBoardHidden
//{
//    [self.chatToolBar endEditing:YES];
//}



//#pragma mark - EMChatBarMoreViewDelegate
//
//- (void)moreViewPhotoAction:(DXChatBarMoreView *)moreView
//{
//    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"isShowPicker"];
//    // 隐藏键盘
//    [self keyBoardHidden];
//    
//    // 弹出照片选择
//    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
////    self.imagePicker.mediaTypes = @[(NSString *)kUTTypeImage];
//    [self presentViewController:self.imagePicker animated:YES completion:NULL];
//}
//
//- (void)moreViewTakePicAction:(DXChatBarMoreView *)moreView
//{
//    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"isShowPicker"];
//    [self keyBoardHidden];
//    
//#if TARGET_IPHONE_SIMULATOR
//    [SVProgressHUD showWithStatus:@"模拟器不支持拍照"];
//    [SVProgressHUD dismiss];
//#elif TARGET_OS_IPHONE
//    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
////    self.imagePicker.mediaTypes = @[(NSString *)kUTTypeImage];
//    [self presentViewController:self.imagePicker animated:YES completion:NULL];
//#endif
//}
//
//- (void)moreViewLocationAction:(DXChatBarMoreView *)moreView
//{
//    // 隐藏键盘
//    [self keyBoardHidden];
//    
////    LocationViewController *locationController = [[LocationViewController alloc] initWithNibName:nil bundle:nil];
////    locationController.delegate = self;
////    [self.navigationController pushViewController:locationController animated:YES];
//}
//
//- (void)moreViewVideoAction:(DXChatBarMoreView *)moreView
//{
//    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:@"isShowPicker"];
//    [self keyBoardHidden];
//    
//#if TARGET_IPHONE_SIMULATOR
//    
//    [SVProgressHUD showWithStatus:@"模拟器不支持录像"];
//    [SVProgressHUD dismiss];
//    
//#elif TARGET_OS_IPHONE
//    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
////    self.imagePicker.mediaTypes = @[(NSString *)kUTTypeMovie];
//    [self presentViewController:self.imagePicker animated:YES completion:NULL];
//#endif
//}
//
//- (void)moreViewAudioCallAction:(DXChatBarMoreView *)moreView
//{
//    // 隐藏键盘
//    [self keyBoardHidden];
////    [[NSNotificationCenter defaultCenter] postNotificationName:@"callOutWithChatter" object:@{@"chatter":self.viewModel.chatter, @"type":[NSNumber numberWithInt:eCallSessionTypeAudio]}];
//}
//
//- (void)moreViewVideoCallAction:(DXChatBarMoreView *)moreView
//{
//    // 隐藏键盘
//    [self keyBoardHidden];
////    [[NSNotificationCenter defaultCenter] postNotificationName:@"callOutWithChatter" object:@{@"chatter":self.self.viewModel.chatter, @"type":[NSNumber numberWithInt:eCallSessionTypeVideo]}];
//}
//
//#pragma mark - LocationViewDelegate
//
//-(void)sendLocationLatitude:(double)latitude longitude:(double)longitude andAddress:(NSString *)address
//{
////    [self.viewModel sendLocationMessageLatitude:latitude longitude:longitude andAddress:address];
//}
//
//
//#pragma mark - DXMessageToolBarDelegate
//- (void)inputTextViewWillBeginEditing:(XHMessageTextView *)messageInputTextView{
////    [_menuController setMenuItems:nil];
//}
//
//- (void)didChangeFrameToHeight:(CGFloat)toHeight
//{
//    [UIView animateWithDuration:0.3 animations:^{
//        CGRect rect = self.tableView.frame;
//        rect.origin.y = 0;
//        rect.size.height = self.view.frame.size.height - toHeight;
//        self.tableView.frame = rect;
//    }];
//    [self scrollViewToBottom:NO];
//}
//
//- (void)didSendText:(NSString *)text
//{
//    if (text && text.length > 0) {
////        [self.viewModel sendMessage:text messageType:eMessageBodyType_Text];
//    }
//}
//
///**
// *  按下录音按钮开始录音
// */
//- (void)didStartRecordingVoiceAction:(UIView *)recordView
//{
////    if (self.viewModel.isCanRecord) {
//        DXRecordView *tmpView = (DXRecordView *)recordView;
//        tmpView.center = self.view.center;
//        [self.view addSubview:tmpView];
//        [self.view bringSubviewToFront:recordView];
//        
//        NSError *error = nil;
////        [[EaseMob sharedInstance].chatManager startRecordingAudioWithError:&error];
////        if (error) {
////            NSLog(NSLocalizedString(@"开始录音失败", @"failure to start recording"));
////        }
////    }
//}
//
///**
// *  手指向上滑动取消录音
// */
//- (void)didCancelRecordingVoiceAction:(UIView *)recordView
//{
////    [[EaseMob sharedInstance].chatManager asyncCancelRecordingAudioWithCompletion:nil onQueue:nil];
//}
//
///**
// *  松开手指完成录音
// */
//- (void)didFinishRecoingVoiceAction:(UIView *)recordView
//{
////    [[EaseMob sharedInstance].chatManager
////     asyncStopRecordingAudioWithCompletion:^(EMChatVoice *aChatVoice, NSError *error){
////         if (!error) {
////             [self.viewModel sendMessage:aChatVoice messageType:eMessageBodyType_Voice];
////         }else{
////             if (error.code == EMErrorAudioRecordNotStarted) {
////                 NSLog(@"环信聊天:录音没有开始错误:%@",error.description);
////             }
////             
////             else if (error.code == EMErrorAudioRecordDurationTooShort)
////             {
////                 [SVProgressHUD showErrorWithStatus:@"按键时间太短"];
////             }
////             
////             else {
////                 NSLog(@"环信聊天:语音聊天错误描述:%@",error.description);
////             }
////         }
////         
////     } onQueue:nil];
//}
//
//
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return 3;
//}
////-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
////    static NSString *cellIdentf = @"mscell";
////    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentf];
////    if (!cell) {
////        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentf];
////        
////    }
////    cell.textLabel.text = @"sssssssssssss";
////    
////    return cell;
////}
//
//
//- (UIImagePickerController *)imagePicker
//{
//    if (_imagePicker == nil) {
//        _imagePicker = [[UIImagePickerController alloc] init];
//        _imagePicker.modalPresentationStyle= UIModalPresentationOverFullScreen;
//        _imagePicker.delegate = self;
//    }
//    
//    return _imagePicker;
//}
//

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
