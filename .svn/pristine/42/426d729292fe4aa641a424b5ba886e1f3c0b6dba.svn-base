//
//  MSIdenViewController.m
//  DaBan
//
//  Created by qkm on 15-8-4.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSIdenViewController.h"
#import "MSComModel.h"


@interface MSIdenViewController ()

@end

@implementation MSIdenViewController

-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBar.hidden = YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self drawView];
    // Do any additional setup after loading the view.
}

- (void)drawView{
    

    
    UIImageView *iconView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    iconView.backgroundColor = [UIColor clearColor];
    iconView.image = [UIImage imageNamed:@"mainBgV.png"];
    iconView.userInteractionEnabled = YES;
    [self.view addSubview:iconView];
    
    UIImageView *idenIV = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-70, 70, 140, 140)];
    idenIV.backgroundColor = [UIColor clearColor];
    idenIV.image = [UIImage imageNamed:@"mainIdent.png"];
    [iconView addSubview:idenIV];
    
    
    UILabel *nameLab = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(idenIV.frame)+10, SCREEN_WIDTH, 30)];
    nameLab.text = @"请您先选择身份";
    nameLab.textColor = [UIColor grayColor];
    nameLab.backgroundColor = [UIColor clearColor];
    nameLab.font = [UIFont systemFontOfSize:17.0];
    nameLab.textAlignment = NSTextAlignmentCenter;
    [iconView addSubview:nameLab];
    
    NSArray *title = @[@"我是车主",@"我是乘客"];
    for (int i = 0; i<2; i++) {
        UIButton *idenBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-75, SCREEN_HEIGHT/2+50+i*70, 150, 40)];
        idenBtn.backgroundColor = APP_COLOR;
        idenBtn.tag = i+1;
        [idenBtn setTitle:title[i] forState:UIControlStateNormal];
        [idenBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        idenBtn.titleLabel.font = [UIFont systemFontOfSize:22];
        idenBtn.layer.cornerRadius = 6.0;
        [idenBtn addTarget:self action:@selector(identClick:) forControlEvents:UIControlEventTouchUpInside];
        [iconView addSubview:idenBtn];
    }
    
}


-(void)identClick:(UIButton *)sender{
      MSComModel *model = [MSComModel shareComModel];
    if (sender.tag ==1) {
        model.ident = @"我是乘客";
    }else if (sender.tag ==2 ){
        model.ident = @"我是车主";
    }
    //当选择后保存数据
    [[NSUserDefaults standardUserDefaults]setObject:model.ident forKey:@"rolelab"];
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)blackAction:(UIButton *)sender{
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
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
