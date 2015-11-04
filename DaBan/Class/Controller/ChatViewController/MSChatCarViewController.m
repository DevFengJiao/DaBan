//
//  MSChatCarViewController.m
//  DaBan
//
//  Created by qkm on 15-9-11.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSChatCarViewController.h"
#import "MSChatCarView.h"


@interface MSChatCarViewController ()<UITableViewDataSource,UITableViewDelegate>

{
    UITableView     *mainTableView;
}
@property (nonatomic, strong) MSChatCarView *chatCarView;
@property (nonatomic, strong) MSUserModel   *model;
@property (nonatomic, strong) NSArray       *titles;
@property (nonatomic, strong) NSArray       *titles2;
@end

@implementation MSChatCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self request];
    
    
    self.titles = @[@"车牌",@"车型",@"颜色"];
    
    mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 226, SCREEN_WIDTH, 55*3)];
    mainTableView.delegate = self;
    mainTableView.dataSource = self;
    mainTableView.scrollEnabled = NO;
    mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    NSLog(@"%@",ROLELAB);
    if ([ROLELAB isEqualToString:@"我是车主"]) {
        [self.view   addSubview:mainTableView];
    }    
}

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
            
            [mainTableView reloadData];
            
        }
        NSLog(@"Test: %@",response);
    }

}

-(void)drawHeadView{
    self.chatCarView = [[MSChatCarView alloc]init];
    if (NULL_STR(self.model.headImgUrl)) {
        self.chatCarView.myHeadImageView.image = [UIImage imageNamed:@"picture-noLog@2x"];
    }else{
        NSLog(@"%@",self.model.headImgUrl);
        self.chatCarView.myHeadImageView.imageURL = [NSURL URLWithString:self.model.headImgUrl];
    }
    self.chatCarView.model = self.model;
    self.chatCarView.frame = CGRectMake(0, 00, SCREEN_WIDTH, 226);
    self.chatCarView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.chatCarView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titles.count;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CELLHEIGHT;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *cellIdentf = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentf];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentf];
    }
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 35, CELLHEIGHT)];
    label.backgroundColor = [UIColor clearColor];
    label.text = self.titles[indexPath.row];
    label.textColor = ZIGRAY;
    label.font = ZIFOUT16;
    [cell.contentView addSubview:label];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(27+CGRectGetMaxX(label.frame), 0, SCREEN_WIDTH/1.5, CELLHEIGHT)];
    label2.backgroundColor = [UIColor clearColor];
    label2.text = self.titles[indexPath.row];
    if (indexPath.row==0) {
        label2.text = self.model.carLicense;
    }else if(indexPath.row == 1){
        label2.text = self.model.carStyle;
    }else{
        label2.text = self.model.carColor;
    }
    
    label2.textColor = ZIGRAY;
    label2.font = ZIFOUT16;
    [cell.contentView addSubview:label2];
    
    UILabel *linelab = [[UILabel alloc]initWithFrame:CGRectMake(0, CELLHEIGHT-0.5, SCREEN_WIDTH, 0.5)];
    linelab.backgroundColor = LINEC;
    [cell.contentView addSubview:linelab];
    
    return cell;
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
