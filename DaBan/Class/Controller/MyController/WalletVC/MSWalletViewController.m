//
//  MSWalletViewController.m
//  DaBan
//
//  Created by qkm on 15-8-19.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSWalletViewController.h"
#import "MSWalletModel.h"
#import "MSWalleCell.h"
#import "MSTopView.h"
#import "MSWalletCouponsViewController.h"
#import "MSWalletDetailedViewController.h"
#import "MSWalletExtractionViewController.h"
#import "MSIdentityViewController.h"

@interface MSWalletViewController ()
{
    NSArray *titles;
    NSArray *images;
    MSTopView *topView;
}
@property (nonatomic, strong)  MSWalletModel *model;
@property (nonatomic, strong)  UILabel       *identLab;
@property (nonatomic, assign)  NSInteger     identityType;//0 未认证 1提交了认证 2已认证
@end


@implementation MSWalletViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.title = @"我的钱包";
    titles = @[@"余额提现",@"交易明细"];
    images = @[@"形状-2-拷贝.png",@"矢量智能对象.png"];
    
    [self requset];
    
     _model = [[MSWalletModel alloc]init];
    double tempWallet = 1000.54;
    _model.wallet =  [NSString stringWithFormat:@"%.2f",tempWallet];
    _model.payment = [NSString stringWithFormat:@"已预付款%.2f元",tempWallet];
    
    
    topView = [[MSTopView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    topView.model = _model;
    NSLog(@"%@",_model.ziStr);
    [self.view addSubview:topView];
    

    
    mainTabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(topView.frame)+10, SCREEN_WIDTH, 55*4+10.5)];
    mainTabelView.delegate = self;
    mainTabelView.dataSource = self;
    mainTabelView.scrollEnabled = NO;
    mainTabelView.showsVerticalScrollIndicator = NO;
    mainTabelView.backgroundColor = [UIColor clearColor];
    mainTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:mainTabelView];

   
    
}

-(void)Identity{
    self.identityType = 1;
    [mainTabelView reloadData];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"identity" object:nil];
}

-(void)viewDidAppear:(BOOL)animated{
}

-(void)requset{
    
    NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:@"session_token"];
    
    NSString *url1 = [url stringByReplacingOccurrencesOfString:@"+" withString:@"%2b"];
    
    NSString *url2 = [url1 stringByReplacingOccurrencesOfString:@"/" withString:@"%2f"];
    
    NSString *url3 = [url2 stringByReplacingOccurrencesOfString:@"=" withString:@"%3d"];
    
    NSURL *url4 = [NSURL URLWithString:[NSString stringWithFormat:@"%@wallet_query?token=%@",DaBan_URL,url3]];
    
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
        
            _model = [[MSWalletModel alloc]init];
            
            double tempWallet = [[dictionary2 objectForKey:@"total_money"]doubleValue]/100;
            _model.wallet =  [NSString stringWithFormat:@"%.2f",tempWallet];
            _model.payment = [NSString stringWithFormat:@"已预付款%.2f元",tempWallet];
            NSLog(@"wall--%@",_model.wallet);
        }else {
            
            [self showMyMessage:@"攻城狮一步一步在努力啦!"];
        }
        
        NSLog(@"Text: %@",response);
    }
    
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return titles.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"MSWalleCell";
    MSWalleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[MSWalleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier
                ];
        
    }
    MSWalletModel *model = [[MSWalletModel alloc]init];
    model.cellTitle  = titles[indexPath.row];
    model.cellImg  = images[indexPath.row];

    cell.model = model;
    
    CGFloat height = 55.0;
    
    if (indexPath.row ==0) {
        _identLab = [[UILabel alloc] init];
        _identLab.frame = CGRectMake(SCREEN_WIDTH-160, 0, 150, 55);
        _identLab.backgroundColor = [UIColor clearColor];
        _identLab.textColor = LINE9;
        _identLab.textAlignment = NSTextAlignmentRight;
        _identLab.font = [UIFont fontWithName:@"Helvetica" size:14];
        //0 未认证 1提交了认证 2已认证
        if (self.identityType == 1) {
            _identLab.text = @"审核中";
        }else if (self.identityType ==2 ){
            _identLab.text = @"已认证";
        }else{
            _identLab.text = @"";
        }
        [cell.contentView addSubview:_identLab];
    }
    
    if (indexPath.row != titles.count-1) {
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, height-0.5, SCREEN_WIDTH, 0.5)];
        line.backgroundColor = LINEC;
        [cell.contentView addSubview:line];
    }
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellStyleDefault;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPat{
    if (indexPat.row == 0) {
//       
//        if (NULL_STR(_identLab.text)&&[_identLab.text isEqualToString:@""]) {
//            MSIdentityViewController *iden = [[MSIdentityViewController alloc]init];
//            [self.navigationController pushViewController:iden animated:YES];
//        }else{
            MSWalletExtractionViewController *extraction = [[MSWalletExtractionViewController alloc]init];
            [self.navigationController pushViewController:extraction animated:YES];
//        }
        
    }else if(indexPat.row == 1){
        MSWalletDetailedViewController *detailed = [[MSWalletDetailedViewController alloc]init];
        [self.navigationController pushViewController:detailed animated:YES];
    }
//    else{
//        MSWalletCouponsViewController *coupons = [[MSWalletCouponsViewController alloc]init];
//        [self.navigationController pushViewController:coupons animated:YES];
//    }
//    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
