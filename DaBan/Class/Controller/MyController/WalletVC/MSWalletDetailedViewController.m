//
//  MSWalletDetailedViewController.m
//  DaBan
//
//  Created by qkm on 15-8-19.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSWalletDetailedViewController.h"
#import "MSDetailCell.h"
#import "MSWalletModel.h"
#import "MJRefresh.h"

/**
 *  随机数据
 */
#define MJRandomData [NSString stringWithFormat:@"-%d", arc4random_uniform(100)]

@interface MSWalletDetailedViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *mainTableView;
    int page;
    int pageSize;
    NSInteger count;
}
@property (nonatomic, assign)NSInteger allPage;
@property (nonatomic, strong)  MSWalletModel *model;
@property (nonatomic, assign) BOOL tagMode;

@property (strong, nonatomic) NSMutableArray *fakeData;
@end

@implementation MSWalletDetailedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"交易明细";
    page = 1;
    pageSize = 10;
    [self drawTableView];
    
    [self setupRefresh];
    [self request];
    
}

//   数据的懒加载
-(NSMutableArray *)fakeData{

    if (!_fakeData) {
        self.fakeData = [NSMutableArray array];
        
        for (int i =0 ; i<12; i++) {
            [self.fakeData addObject:MJRandomData];
        }
    }
    return _fakeData;
}

-(void)drawTableView
{
    if (!mainTableView) {
        mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        mainTableView.delegate = self;
        mainTableView.dataSource = self;
        mainTableView.backgroundColor = [UIColor clearColor];
        [self.view addSubview: mainTableView];
    }
    
}

-(void)setupRefresh{
    [mainTableView addHeaderWithTarget:self action:@selector(headerRershing) dateKey:@"table"];
    [mainTableView headerBeginRefreshing];
    [mainTableView addFooterWithTarget:self action:@selector(footerRereshing)];
    // 设置文字(也可以不设置,默认的文字在MJRefreshConst中修改)
    mainTableView.headerPullToRefreshText = @"下拉可以刷新了";
    mainTableView.headerReleaseToRefreshText = @"松开马上刷新了";
 
    
    mainTableView.footerPullToRefreshText = @"上拉可以加载更多数据了";
    mainTableView.footerReleaseToRefreshText = @"松开马上加载更多数据了";
//    mainTableView.footerRefreshingText = @"MJ哥正在帮你加载中,不客气";
    [mainTableView addFooterWithCallback:^{
        
    }];
}

-(void)headerRershing{
    // 1.添加假数据
    for (int i = 0; i<10; i++) {
        [self.fakeData insertObject:MJRandomData atIndex:0];
    }
    
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [mainTableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [mainTableView headerEndRefreshing];
//    });


}

-(void)footerRereshing{
    // 1.添加假数据
    for (int i = 0; i<10; i++) {
        [self.fakeData addObject:MJRandomData];
    }
    
    // 2.模拟2秒后刷新表格UI（真实开发中，可以移除这段gcd代码）
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 刷新表格
        [mainTableView reloadData];
        
        // (最好在刷新表格后调用)调用endRefreshing可以结束刷新状态
        [mainTableView footerEndRefreshing];
//    });

}


-(void)request{
    
    NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:@"session_token"];
    
    NSString *url1 = [url stringByReplacingOccurrencesOfString:@"+" withString:@"%2b"];
    
    NSString *url2 = [url1 stringByReplacingOccurrencesOfString:@"/" withString:@"%2f"];
    
    NSString *url3 = [url2 stringByReplacingOccurrencesOfString:@"=" withString:@"%3d"];
    
    NSURL *url4 = [NSURL URLWithString:[NSString stringWithFormat:@"%@trade_details?token=%@",DaBan_URL,url3]];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url4];
    
    [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
    
    [request addRequestHeader:@"Accept" value:@"application/json"];
    
    [request setRequestMethod:@"POST"];
    
    [SVProgressHUD dismiss];
    
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
            
//            _model = [[MSWalletModel alloc]init];
//            _model.ziStr = @"账户余额(元)";
//            _model.bgImg = @"bGImg.png";
//            
//            double tempWallet = [[dictionary2 objectForKey:@"total_money"]doubleValue]/100;
//            _model.wallet =  [NSString stringWithFormat:@"%.2f",tempWallet];
//            _model.payment = [NSString stringWithFormat:@"已预付款%.2f元",tempWallet];
//            NSLog(@"wall--%@",_model.wallet);
        }else {
            
            [self showMyMessage:@"攻城狮一步一步在努力啦!"];
        }
        
        NSLog(@"Text: %@",response);
    }
    
    


}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.fakeData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentf = @"MSDetailCell";
    MSDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentf];
    if (cell == nil) {
        cell = [[MSDetailCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentf];
    }
    
    MSWalletModel *model = [[MSWalletModel alloc]init];
    model.price  = self.fakeData[indexPath.row];
    model.priceTime = @"1970-05-30";

   //字体有二种颜色 黑色与蓝色
    if (indexPath.row%2 == 0) {
        model.priceCon = @"支出";
        
    }else{
        model.priceCon = @"收入";
    }
    cell.model = model;
    
    
    if (indexPath.row != self.fakeData.count-1) {
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, CELLHEIGHT-0.5, SCREEN_WIDTH, 0.5)];
        line.backgroundColor = [UIColor colorFromHexString:@"0xc8c8c8"];
        [cell.contentView addSubview:line];
    }
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellStyleDefault;
    return cell;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
