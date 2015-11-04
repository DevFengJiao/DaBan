//
//  MSTravelViewController.m
//  DaBan
//
//  Created by qkm on 15-7-30.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSTravelViewController.h"
#import "MSScrollView.h"
#import "MSLineViewController.h"

@interface MSTravelViewController ()

@end

@implementation MSTravelViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"发现";
    
    NSLog(@"11111111111111");
    NSLog(@"11111111111111");
    NSLog(@"11111111111111");
    MSScrollView *mainScrollView = [[MSScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    mainScrollView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:mainScrollView];
    
    if (_isTravel == NO) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 165, SCREEN_WIDTH-20, 51)];
        [btn setTitle:@"我的线路" forState:UIControlStateNormal];
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitleColor:ZIGRAY forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:18.0 ]];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
    }else{
    
    }
}

-(void)btnClick:(UIButton *)sender{
    
    MSLineViewController *line = [[MSLineViewController alloc]init];
    
    [self.navigationController pushViewController:line animated:YES];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
