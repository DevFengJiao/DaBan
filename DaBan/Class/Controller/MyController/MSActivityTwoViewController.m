//
//  MSActivityTwoViewController.m
//  DaBan
//
//  Created by qkm on 15-8-19.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSActivityTwoViewController.h"
#import "UMSocial.h"

@interface MSActivityTwoViewController ()<UMSocialDataDelegate,UMSocialUIDelegate>
{
    UILabel *lab;
    NSArray *titles;
    NSArray *images;
}

@end

@implementation MSActivityTwoViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"邀请好友";
    titles = @[@"微信",@"朋友圈",@"微博",@"QQ"];
    images = @[@"share-wx",@"share-p",@"share-wb",@"share-qq"];
    
    
    
    UIView *bgV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    bgV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgV];
    
    lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 30, SCREEN_WIDTH, 20)];
    lab.backgroundColor = [UIColor clearColor];
    lab.textColor = [UIColor colorFromHexString:@"0xe87e30"];
    lab.font = [UIFont systemFontOfSize:20];
    lab.textAlignment = NSTextAlignmentCenter;
    [bgV addSubview:lab];
    
    UILabel *bgLab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(lab.frame)+10, SCREEN_WIDTH, 12)];
    bgLab.backgroundColor = [UIColor clearColor];
    bgLab.textColor = LINE9;
    bgLab.font = [UIFont systemFontOfSize:12.0];
    bgLab.textAlignment = NSTextAlignmentCenter;
    bgLab.text = @"分享邀请码 好友首次拼车即可获得30元优惠券!";
    [bgV addSubview:bgLab];
    
    [self requset];
    
    mainTabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(bgV.frame)+10, SCREEN_WIDTH, 43*4+10.5)];
    mainTabelView.delegate = self;
    mainTabelView.dataSource = self;
    mainTabelView.scrollEnabled = NO;
    mainTabelView.showsVerticalScrollIndicator = NO;
    mainTabelView.backgroundColor = [UIColor clearColor];
    mainTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:mainTabelView];
}
-(void)requset{
    NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:@"session_token"];
    
    NSString *url1 = [url stringByReplacingOccurrencesOfString:@"+" withString:@"%2b"];
    
    NSString *url2 = [url1 stringByReplacingOccurrencesOfString:@"/" withString:@"%2f"];
    
    NSString *url3 = [url2 stringByReplacingOccurrencesOfString:@"=" withString:@"%3d"];
    
    NSURL *url4 = [NSURL URLWithString:[NSString stringWithFormat:@"%@invite_code_get?token=%@",DaBan_URL,url3]];
    
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
            
            lab.text =[dictionary2 objectForKey:@"invite_code"];
            
            NSLog(@"%@",[dictionary2 objectForKey:@"invite_code"]);
        }else {
            
            [self showMyMessage:@"接口异常!"];
        }
        
    }
    


}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return titles.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 43;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier
                ];
    }
    
    for (id subView in cell.contentView.subviews) {
        
        if ([subView isKindOfClass:[UIView class]]) {
            
            UIView *vie = (UIView *)subView;
            [vie removeFromSuperview];
        }
    }
    
    UIImageView *imagV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 7.5, 30, 30)];
    imagV.backgroundColor = [UIColor clearColor];
    imagV.image = [UIImage imageNamed:images[indexPath.row]];
    [cell.contentView addSubview:imagV];
    
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10+37, 0, 140, 42)];
    titleLabel.text = titles[indexPath.row];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = ZICOLOR;
    titleLabel.font = [UIFont systemFontOfSize:17];
    [cell.contentView addSubview:titleLabel];
    
    if (indexPath.row != titles.count-1) {
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, 42.5, SCREEN_WIDTH, 0.5)];
        line.backgroundColor = LINE9;
        [cell.contentView addSubview:line];
    }

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellStyleDefault;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPat{
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:kUMSocialKey
                                      shareText:@"快来领钱啦。。。搭伴创造美好出行"
                                     shareImage:[UIImage imageNamed:@"搭伴icon-108x108"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToWechatSession,UMShareToQzone,UMShareToQQ,nil]
                                       delegate:self];
    
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
