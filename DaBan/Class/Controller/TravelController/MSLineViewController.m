//
//  MSLineViewController.m
//  DaBan
//
//  Created by qkm on 15-8-13.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSLineViewController.h"
#import "MSLineModel.h"
#import "MSLineTableViewCell.h"
#import "MSLineAddViewController.h"


@interface MSLineViewController ()
@property (nonatomic, strong)UIBarButtonItem *editButton;
@end

@implementation MSLineViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"我的路线";
     [self setNavigationBarRightbuttonImage:@"add.png"];
    myArray = [NSMutableArray array];
    
    [self request];
    
    [self drawView];
}



-(void)rightBtnActionImage: (UIButton *)sender{
    //显示多选圆圈
    
}

-(void)drawView{
    UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-45, 55, 90, 90)];
    imgV.backgroundColor = [UIColor clearColor];
    imgV.image = [UIImage imageNamed:@"travel-nor@2x.png"];
    [self.view addSubview:imgV];
    
    UILabel *labe = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imgV.frame)+20, SCREEN_WIDTH, 14)];
    labe.backgroundColor = [UIColor clearColor];
    labe.textColor = LINE9;
    labe.textAlignment  = NSTextAlignmentCenter;
    labe.text = @"还没有线路哦";
    [self.view addSubview:labe];
    NSLog(@"%.2f",SCREEN_WIDTH);
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-72.5, CGRectGetMaxY(labe.frame)+15, 145, 40)];
    btn.backgroundColor = BGVCOLOR;
    [btn setTitle:@"马上添加" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    [btn addTarget:self action:@selector(addClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

#pragma mark 网络请求

-(void)request{
    NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:@"session_token"];
    
    NSString *url1 = [url stringByReplacingOccurrencesOfString:@"+" withString:@"%2b"];
    
    NSString *url2 = [url1 stringByReplacingOccurrencesOfString:@"/" withString:@"%2f"];
    
    NSString *url3 = [url2 stringByReplacingOccurrencesOfString:@"=" withString:@"%3d"];
    
    NSURL *url4 = [NSURL URLWithString:[NSString stringWithFormat:@"%@user/me/get?token=%@",DaBan_URL,url3]];
    
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
            
//            [self drawTableView];
            
            

            
//            self.model = [[MSUserModel alloc]initWithDictionary:dictionary2];
            
        }else {
            
            [self showMyMessage:@"接口异常!"];
        }
        
    }
    
}



-(void)drawTableView{
    mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-20, SCREEN_HEIGHT)style:UITableViewStyleGrouped];
    mainTableView.backgroundColor = [UIColor  clearColor];
    mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    mainTableView.dataSource = self;
    mainTableView.delegate = self;
  
    [self.view addSubview:mainTableView];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 10;
    }
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 4;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [self tableView:tableView  cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
//    return 44;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"MSLineTableViewCell";
    MSLineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil) {
        cell = [[MSLineTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    MSLineModel *model = [[MSLineModel alloc]init];
    model.start = @"起点喹枯叶jasd地";
    model.end = @"压力23圆顶时";
    model.time = @"dddddddddd";
    model.content = @"11";
    cell.model = model;
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}


-(void)addClick:(UIButton *)sender{

    MSLineAddViewController *add = [[MSLineAddViewController  alloc]init];
    [self.navigationController pushViewController:add animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
