//
//  MSMoreViewController.m
//  DaBan
//
//  Created by qkm on 15-8-17.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSMoreViewController.h"
#import "MSHelpViewController.h"
#import "MSAgreeViewController.h"
#import "MSLoginViewController.h"
#import "MSAboutViewController.h"


@interface MSMoreViewController ()
@property (nonatomic, strong)UIView   *myView;
@end

@implementation MSMoreViewController

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更多";
    mainTabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CELLHEIGHT*4+20.5)style:UITableViewStyleGrouped];
    mainTabelView.delegate = self;
    mainTabelView.dataSource = self;
    mainTabelView.scrollEnabled = NO;
    mainTabelView.showsVerticalScrollIndicator = NO;
    mainTabelView.backgroundColor = [UIColor clearColor];
    mainTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:mainTabelView];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(mainTabelView.frame)+15, SCREEN_WIDTH, 15)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = LINE9;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"当前版本 %@",@"vsss"];
//    [self.view addSubview:label];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    }else {
        return 1;
    }
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 0.00001;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CELLHEIGHT;
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
    CGFloat height = CELLHEIGHT;
    
    NSArray *titles = @[@"协议",@"关于我们"];
    if (indexPath.section == 0) {
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 140, height)];
        titleLabel.text = titles[indexPath.row];
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = ZICOLOR;
        titleLabel.font = [UIFont systemFontOfSize:16];
        [cell.contentView addSubview:titleLabel];
        if (indexPath.row == 0) {
            UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, height-0.5, SCREEN_WIDTH, 0.5)];
            line.backgroundColor = LINE9;
            [cell.contentView addSubview:line];
        }
        
    }else if(indexPath.section == 1){
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 140, height)];
        titleLabel.text = @"给我们的APP评分";
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = ZICOLOR;
        titleLabel.font = [UIFont systemFontOfSize:16];
        [cell.contentView addSubview:titleLabel];

    }else if(indexPath.section == 2){
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 140, height)];
        titleLabel.text = @"退出登录";
        titleLabel.backgroundColor = [UIColor clearColor];
        titleLabel.textColor = [UIColor colorFromHexString:@"0xf45d48"];
        titleLabel.font = [UIFont systemFontOfSize:16];
        [cell.contentView addSubview:titleLabel];

    }

    cell.selectionStyle = UITableViewCellStyleDefault;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            MSAgreeViewController  *agree = [[MSAgreeViewController  alloc]init];
            [self.navigationController pushViewController:agree animated:YES];
        }else{
            MSAboutViewController *about = [[MSAboutViewController alloc]init];
            [self.navigationController pushViewController:about animated:YES];
        }
    }else if (indexPath.section == 1){

    
    }else{
    
        self.myView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        self.myView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
        [self.view addSubview:self.myView];
        
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-120, 427/2-64, 240, 140)];
        iv.backgroundColor = [UIColor clearColor];
        iv.image = [UIImage  imageNamed:@"sureOK.png"];
        iv.userInteractionEnabled = YES;
        iv.layer.cornerRadius = 3.0;
        [self.myView addSubview:iv];
        
        UILabel *titleLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 40, iv.frame.size.width, 16)];
        titleLab.backgroundColor = [UIColor clearColor];
        titleLab.textAlignment = NSTextAlignmentCenter;
        titleLab.font = ZIFOUT14;
        titleLab.textColor = ZICOLOR;
        titleLab.text = @"确定要退出登录吗";
        [iv  addSubview:titleLab];
        
        NSArray *titles = @[@"取消",@"确定"];
        for (int i = 0; i<2; i++) {
            UIButton *btn = [[UIButton    alloc]initWithFrame:CGRectMake(0+i*120, iv.frame.size.height-33, 120, 33)];
            btn.backgroundColor = [UIColor clearColor];
            [btn setTitle:titles[i] forState:UIControlStateNormal];
            btn.tag = i;
            [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
            if (i == 0) {
                [btn setTitleColor:APP_COLOR forState:UIControlStateNormal];
            }else{
                [btn setTitleColor:ZIGRAY forState:UIControlStateNormal];
            }
            [iv addSubview:btn];
        }
    }
    
}

-(void)click:(UIButton *)sender{
    if (sender.tag == 0) {
        
    }else if (sender.tag == 1){
//        NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
//        [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
        
        
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"USERLogin"];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"USERID"];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"session_token"];
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"mobilephone1"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        
        MSLoginViewController *log = [[MSLoginViewController alloc]init];
        log.type = 1;
        [self.navigationController pushViewController:log animated:YES];
    }
    [self.myView removeFromSuperview];
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
