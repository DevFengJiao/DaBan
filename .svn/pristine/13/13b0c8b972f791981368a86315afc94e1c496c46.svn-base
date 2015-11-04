//
//  MSActivityViewController.m
//  DaBan
//
//  Created by qkm on 15-8-21.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSActivityViewController.h"
#import "MSActivityTwoViewController.h"
#import "MSActivityModel.h"
#import "MSActivityTableViewCell.h"
#import "MSActivityDetailViewController.h"
#import "YALContextMenuTableView.h"
#import "ContextMenuCell.h"
#import "MSMenuView.h"
#import "CDConversationStore.h"

static NSString *const menuCellIdentifier = @"rotationCell";

@interface MSActivityViewController ()<YALContextMenuTableViewDelegate>
{
    NSArray *mArray;
    NSArray *images;
    NSArray *cellImages;
    UIButton *rightBtn;
    MSMenuView *menu;
}
@property (nonatomic, strong) YALContextMenuTableView* contextMenuTableView;
@end

@implementation MSActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"活动拼车";

    self.navigationItem.leftBarButtonItem = nil;
    
    [self setNavigationBarRightbutton];
    
    cellImages = @[@"xxhdpi-01",@"xxhdpi-02",@"xxhdpi-03"];
    
    mainTabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-TABBARHEIGHT)];
    mainTabelView.delegate = self;
    mainTabelView.dataSource = self;
    mainTabelView.backgroundColor = [UIColor clearColor];
    mainTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:mainTabelView];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(menu:) name:@"menu" object:nil];
}

-(void)menu:(NSNotification *)notification{
   //带参数的通知
    NSLog(@"object:--%@",[notification object]);
    rightBtn.userInteractionEnabled = YES;
    [menu removeFromSuperview];
   
}

- (void)setNavigationBarRightbutton{
    rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(25, 0, 80, 25);
    rightBtn.backgroundColor = [UIColor clearColor];
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
    [rightBtn setTintColor:[UIColor whiteColor]];
    [rightBtn addTarget:self action:@selector(rightBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *iconIV = [[UIImageView alloc]initWithFrame:CGRectMake(65, 1.5, 22, 22)];
    iconIV.backgroundColor = [UIColor clearColor];
    iconIV.image = [UIImage imageNamed:@"01-1菜单icon.png"];
    [rightBtn addSubview:iconIV];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}

- (void)rightBtnAction:(UIButton *)sender{
    menu = [[MSMenuView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:menu];
    rightBtn.userInteractionEnabled = NO;
}


#pragma -mark
#pragma -mark TableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 153;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"MSActivityTableViewCell";
    MSActivityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[MSActivityTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier
                ];
        
    }
 
    cell.selectionStyle = UITableViewCellStyleDefault;
    MSActivityModel *model = [[MSActivityModel alloc]init];
    model.time = @"2015.08.20";
    model.image = cellImages[indexPath.row%3];
    model.title = @"天读止可进国框架夲天";
    model.addr  = @"深圳11111";
    model.carImg = @"01-1车icon";
    cell.model = model;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPat{
    MSActivityDetailViewController *action = [[MSActivityDetailViewController alloc]init];
    [self.navigationController pushViewController:action animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
