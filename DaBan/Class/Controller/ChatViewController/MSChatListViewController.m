//
//  MSChatListViewController.m
//  DaBan
//
//  Created by qkm on 15-8-21.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSChatListViewController.h"
//#import "MSChatCell.h"
//#import "MJRefresh.h"
#import "MSChatCarViewController.h"
//#import "MSChatViewController.h"

#import "MSCDChatViewController.h"
#import "CDChatManager.h"
#import "CDConversationStore.h"
#import "LCEChatRoomVC.h"

/**
 *  随机数据
 */
#define MJRandomData [NSString stringWithFormat:@"-%d", arc4random_uniform(100)]

@interface MSChatListViewController ()<UITableViewDataSource,UITableViewDelegate,CDChatListVCDelegate>
{

    UITableView         *mainTableView;
    NSMutableArray      *myArrays;
    int page;
    int pageSize;
    NSInteger count;
    
    NSArray             *images; //图片假数据
}
//@property (nonatomic, strong) MSChatModel *model;
@end

@implementation MSChatListViewController



- (instancetype)init {
    self = [super init];
    if (self) {
        self.chatListDelegate = self;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"搭伴";
    self.navigationItem.leftBarButtonItem = nil;
//    images = @[@"http://ac-qgsi8evy.clouddn.com/MqHCKWPS350ux5CkfWdKRKiJddsK2geYIMnsY4lM.jpg",@"http://ac-qgsi8evy.clouddn.com/MqHCKWPS350ux5CkfWdKRKiJddsK2geYIMnsY4lM.jpg",@"http://ac-qgsi8evy.clouddn.com/MqHCKWPS350ux5CkfWdKRKiJddsK2geYIMnsY4lM.jpg"];
//    page = 1;
//    pageSize = 10;
//    myArrays = [NSMutableArray array];
//    self.model = [[MSChatModel alloc]init];
    
//    [self drawTableView];
//    [self setupRefresh];
//
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(rightBarButtonClicked:)];
    UIBarButtonItem *logoutItem = [[UIBarButtonItem alloc] initWithTitle:@"退出" style:UIBarButtonItemStylePlain target:self action:@selector(logout:)];
    self.navigationItem.rightBarButtonItems = @[logoutItem, addItem];
}

- (void)logout:(id)sender {
    [[CDChatManager manager] closeWithCallback: ^(BOOL succeeded, NSError *error) {
        UIApplication *app = [UIApplication sharedApplication];
        [app performSelector:@selector(suspend)];
        [self performSelector:@selector(exitApp:) withObject:nil afterDelay:0.5];
    }];
}

- (void)exitApp:(id)sender {
    exit(0);
}


- (void)viewController:(UIViewController *)viewController didSelectConv:(AVIMConversation *)conv {
    LCEChatRoomVC *chatRoomVC = [[LCEChatRoomVC alloc] initWithConv:conv];
    chatRoomVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:chatRoomVC animated:YES];
}

- (void)setBadgeWithTotalUnreadCount:(NSInteger)totalUnreadCount {
    if (totalUnreadCount > 0) {
        self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%d", (int)totalUnreadCount];
    }
    else {
        self.tabBarItem.badgeValue = nil;
    }
}

- (void)rightBarButtonClicked:(id)sender {
    NSString *groupId1 = @"uu";
    NSString *groupId2 = @"ii";
    if (groupId1.length > 0 && groupId2.length > 0) {
        WEAKSELF
        NSMutableArray *memberIds = [NSMutableArray array];
        [memberIds addObject:groupId1];
        [memberIds addObject:groupId2];
        [memberIds addObject:[CDChatManager manager].selfId];
        [[CDChatManager manager] fetchConvWithMembers:memberIds callback: ^(AVIMConversation *conversation, NSError *error) {
            if (error) {
                DLog(@"%@", error);
            }
            else {
                LCEChatRoomVC *chatRoomVC = [[LCEChatRoomVC alloc] initWithConv:conversation];
                [weakSelf.navigationController pushViewController:chatRoomVC animated:YES];
            }
        }];
    }

   
}
//- (void)configureCell:(LZConversationCell *)cell atIndexPath:(NSIndexPath *)indexPath withConversation:(AVIMConversation *)conversation{
//
//}

////   数据的懒加载
//-(NSMutableArray *)myArrays{
//    
//    if (!myArrays) {
//        myArrays = [NSMutableArray array];
//        
//        for (int i =0 ; i<12; i++) {
//            [myArrays addObject:MJRandomData];
//        }
//    }
//    return myArrays;
//}
/*
-(void)setupRefresh{
    [mainTableView addHeaderWithTarget:self action:@selector(headerRershing) dateKey:@"table"];
    [mainTableView headerBeginRefreshing];
    [mainTableView addFooterWithTarget:self action:@selector(footerRereshing)];
    // 设置文字(也可以不设置,默认的文字在MJRefreshConst中修改)
    mainTableView.headerPullToRefreshText = @"下拉可以刷新了";
    mainTableView.headerReleaseToRefreshText = @"松开马上刷新了";
//    mainTableView.headerRefreshingText = @"MJ哥正在帮你刷新中,不客气";
    
    mainTableView.footerPullToRefreshText = @"上拉可以加载更多数据了";
    mainTableView.footerReleaseToRefreshText = @"松开马上加载更多数据了";
//    mainTableView.footerRefreshingText = @"MJ哥正在帮你加载中,不客气";
}

-(void)headerRershing{
//     1.添加假数据
    [myArrays removeAllObjects];
    for (int i = 0; i<12; i++) {
        [myArrays insertObject:MJRandomData atIndex:0];
    }
    
    // 刷新表格
    [mainTableView reloadData];
    
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [mainTableView headerEndRefreshing];


}

-(void)footerRereshing{
//     1.添加假数据
    for (int i = 0; i<12; i++) {
        [myArrays addObject:MJRandomData];
    }
    // 刷新表格
    [mainTableView reloadData];
    
    // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
    [mainTableView footerEndRefreshing];
}



-(void)drawTableView{
    mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-TABBARHEIGHT)];
    mainTableView.delegate = self;
    mainTableView.dataSource = self;
    mainTableView.backgroundColor = [UIColor clearColor];
    mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:mainTableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return myArrays.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 71.0;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentf = @"MSChatCell";
    MSChatCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentf];
    if (!cell) {
        cell = [[MSChatCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentf];
        self.model.title = @"读书会";
        self.model.time  = @"2015.2.8";
        self.model.headImgs = images;
        self.model.identf = @"1";
        cell.model = self.model;
    }
    
    if (indexPath.row != myArrays.count-1) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 70.5, SCREEN_WIDTH, 0.5)];
        label.backgroundColor = LINEC;
        [cell.contentView addSubview:label];
    }
   
 
    cell.contentView.backgroundColor = [UIColor whiteColor];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row ==0) {
        MSChatCarViewController *car = [[MSChatCarViewController alloc]init];
        [self.navigationController pushViewController:car animated:YES];
    }else{

        
    }
}

*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
