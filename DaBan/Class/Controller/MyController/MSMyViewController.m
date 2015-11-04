//
//  MSMyViewController.m
//  DaBan
//
//  Created by qkm on 15-7-30.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSMyViewController.h"
#import "MSLoginViewController.h"
#import "MSIdenViewController.h"
#import "MSComModel.h"
#import "MSUserViewController.h"
#import "MSThird.h"
#import "ASIHTTPRequest.h"
#import "MSMoreViewController.h"
#import "MSActivityViewController.h"
#import "MSWalletViewController.h"
#import "MSMyHeadView.h"
#import "MSHelpViewController.h"


@interface MSMyViewController ()
{
    NSString *mobilePhone;
    NSString *userName;
    NSString *imageUrl;
    MSMyHeadView *headView;
}
@property (nonatomic, strong) NSString *retcode;
@end

@implementation MSMyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
    
    NSString *userId = [[NSUserDefaults standardUserDefaults] objectForKey:@"USERID"];
    NSLog(@"userId:%@",userId);
    if (NULL_STR(userId)){
        mobilePhone = nil;
        userName = nil;
        imageUrl = nil;
    }else{
        mobilePhone = MOBILE;
        userName = USERNAME;
        imageUrl = ICON;
        //第三方登录更新token 1是手机登录 2是其它登录
        if ([[NSUserDefaults standardUserDefaults]integerForKey:@"LONGTYPE"]==1) {
            [self request];
        }else{
            [self requestAuto_login];
        }
    }
    NSLog(@"userName--%@  url:%@",userName,imageUrl);
    [self drawHeadView];
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
            
//            NSString *tem = result[@"data"];
//            NSData* myData=[tem dataUsingEncoding:NSUTF8StringEncoding];
//            
//            id dictionary2 = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingAllowFragments error:nil];
//            NSString *session_token = dictionary2[@"session_token"];
//            [[NSUserDefaults standardUserDefaults] setObject:session_token forKey:@"session_token"];
        }
    }
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = nil;
    self.imageArrays = [NSMutableArray arrayWithObjects:@"my_01",@"my_02",@"my_03",@"my_04",nil];
    self.titleArrays = [NSMutableArray arrayWithObjects:@"角色切换",@"我的钱包",@"帮助",@"更多", nil];
    [self request];
    self.title = @"我的";
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
            
            self.model = [[MSUserModel alloc]initWithDictionary:dictionary2];
            [self drawHeadView];
             [_mainTableView reloadData];
        }

    }
    if (_mainTableView) {
        [_mainTableView reloadData];
    }else{
        [self drawTableView];
    }
}

-(void)requestRole{
    int i;
    if ([_rolelab.text isEqualToString:@"我是乘客"]) {
        i = 1;
    }else{
        i = 2;
    }
    NSURL *url4 = [NSURL URLWithString:[NSString stringWithFormat:@"%@role?token=%@&role=%d",DaBan_URL,[self url],i]];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url4];
    
    [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
    
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeNone];
    
    [request addRequestHeader:@"Accept" value:@"application/json"];
    
    [request setRequestMethod:@"POST"];
    
    [request startSynchronous];
    
    
    NSError *error1 = [request error];
    if (!error1) {
        NSString *response = [request responseString];
        NSData *data = [response dataUsingEncoding:NSUTF8StringEncoding];
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        NSLog(@"%@",result);
        
        if ([[result objectForKey:@"retcode"]intValue] == 0) {
            
            if (i ==1) {
                _rolelab.text = @"我是车主";
            }else{
                _rolelab.text = @"我是乘客";
            }
            [[NSUserDefaults standardUserDefaults]setObject:_rolelab.text forKey:@"rolelab"];
        }
        [SVProgressHUD dismiss];
    }
    
}

-(void)requestAlipay{
    
    NSURL *url4 = [NSURL URLWithString:[NSString stringWithFormat:@"%@pay/alipay/sign?token=%@",DaBan_URL,[self url]]];
    
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
            
            self.model = [[MSUserModel alloc]initWithDictionary:dictionary2];
            
            [self drawHeadView];
            [_mainTableView reloadData];
            
        }
         NSLog(@"Test: %@",response);
    }

}

-(void)drawHeadView{
    if (!headView) {
        headView = [[MSMyHeadView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 190)];
    }
    

    if (NULL_STR(imageUrl)) {
        headView.myHeadImageView.image = [UIImage imageNamed:@"picture-noLog@2x"];
    }else{
        headView.myHeadImageView.imageURL = [NSURL URLWithString:imageUrl];
    }
    headView.model = self.model;
    headView.myName.text = userName;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headViewClick:)];
    tap.numberOfTapsRequired = 1;
    tap.delegate = self;
    [headView.myHeadImageView addGestureRecognizer:tap];
    [self.view addSubview:headView];
}

-(void)drawTableView{
    
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 190, SCREEN_WIDTH, 55*4)];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.backgroundColor = [UIColor clearColor];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.scrollEnabled = NO;
        [self.view addSubview:_mainTableView];
    }
    
}



#pragma mark UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    for (id subView in cell.contentView.subviews) {
        
        if ([subView isKindOfClass:[UIView class]]) {
            
            UIView *vie = (UIView *)subView;
            [vie removeFromSuperview];
        }
    }
    
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.backgroundColor = UIColorFromRGB(0xF0F0F0);
    cell.backgroundColor = [UIColor whiteColor];
    
    UIImageView *iconIV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 17.5, 20.33, 20)];
    iconIV.backgroundColor = [UIColor clearColor];
    iconIV.image = [UIImage imageNamed:_imageArrays[indexPath.row]];
    [cell.contentView addSubview:iconIV];
    
    UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(40, 0, 100, 55)];
    titleLab.backgroundColor = [UIColor clearColor];
    titleLab.text = _titleArrays[indexPath.row];
    titleLab.textColor = ZIGRAY;
    titleLab.font = [UIFont systemFontOfSize:16];
    [cell.contentView addSubview:titleLab];
    
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 54.5, SCREEN_WIDTH, 0.5)];
    line.backgroundColor = LINEC;
    [cell.contentView addSubview:line];
    
    switch (indexPath.row) {
        case 0:
        {
            _rolelab = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-80, 0, 70, 55)];
            _rolelab.backgroundColor = [UIColor clearColor];
            _rolelab.textAlignment = NSTextAlignmentRight;
            _rolelab.textColor = ZIGRAY;
            _rolelab.text = ROLELAB;
            _rolelab.font = [UIFont systemFontOfSize:14];
            [cell.contentView addSubview:_rolelab];
        }
            break;
        case 1:{
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-80, 0, 70, 55)];
            label.backgroundColor = [UIColor clearColor];
            label.textAlignment = NSTextAlignmentRight;
            label.textColor = ZIGRAY;
            label.text = @"明细 余额";
            label.font = [UIFont systemFontOfSize:14];
            [cell.contentView addSubview:label];
        }
            break;
        default:
            break;
    }
    
    return cell;
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArrays.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPat{
    
    return 55.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *userId = [[NSUserDefaults standardUserDefaults] objectForKey:@"USERID"];
//    NSLog(@"userId:%@",userId);
    if (NULL_STR(userId)) {
        MSLoginViewController  *login = [[MSLoginViewController alloc]init];
        //这个方法在viewcontroller push navigation之前执行，也还比较方便
        [login setHidesBottomBarWhenPushed:YES];
        self.navigationController.navigationBar.hidden = YES;
        [self.navigationController pushViewController:login animated:YES];
        
    }else{
        switch (indexPath.row) {
            case 0:
            {
                [self requestRole];
            }
                break;
            case 1:
            {
                MSWalletViewController *wallet = [[MSWalletViewController alloc]init];
                [wallet setHidesBottomBarWhenPushed:YES];
                [self.navigationController pushViewController:wallet animated:YES];
            }
                break;
            case 2:
            {
                MSHelpViewController *help = [[MSHelpViewController alloc]init];
                [help setHidesBottomBarWhenPushed:YES];
                [self.navigationController pushViewController:help animated:YES];
            }
                break;
            case 3:
            {
                MSMoreViewController *more = [[MSMoreViewController alloc]init];
                [more setHidesBottomBarWhenPushed:YES];
                [self.navigationController pushViewController:more animated:YES];
            }
                break;
   
            default:
                break;
        }
    }
}


-(void)headViewClick:(UIGestureRecognizer *)tap{
    NSString *userId = [[NSUserDefaults standardUserDefaults] objectForKey:@"USERID"];
    if ( NULL_STR(userId)) {
        
        MSLoginViewController  *login = [[MSLoginViewController alloc]init];
        //这个方法在viewcontroller push navigation之前执行，也还比较方便
        [login setHidesBottomBarWhenPushed:YES];
        self.navigationController.navigationBar.hidden = YES;
        [self.navigationController pushViewController:login animated:YES];
    }else{
        if (1) {
            MSUserViewController *user = [[MSUserViewController alloc]init];
            user.rolelab = _rolelab.text;
            [user setHidesBottomBarWhenPushed:YES];
            [self.navigationController  pushViewController:user animated:YES];
        }else{
            MSIdenViewController  *iden = [[MSIdenViewController alloc]init];
            [self.navigationController pushViewController:iden animated:YES];
        }
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
