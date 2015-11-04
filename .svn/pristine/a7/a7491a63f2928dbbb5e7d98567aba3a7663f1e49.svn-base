//
//  MSReserveViewController.m
//  DaBan
//
//  Created by qkm on 15-8-27.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSReserveViewController.h"
#import "MSReserveView.h"
#import "MSWindosView.h"

@interface MSReserveViewController ()<MSWindowsDelegate>
{
    MSActivityModel *model;
}
@property (nonatomic, strong) MSReserveView *reserveView;
@property (nonatomic, strong) MSWindosView  *windowView;
@end

@implementation MSReserveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"预付款";

    model = [[MSActivityModel alloc]init];
    model.carName = @"史塔克-布兰";
    model.addr = @"深圳宝安体育中心";
    model.time = @"10-8";
    model.pcice = @"11";
    model.image = @"Default-568h@2x";
    model.range = [NSString stringWithFormat:@"%.1fKM",self.distance];
    
    self.reserveView = [[MSReserveView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.reserveView.backgroundColor = [UIColor whiteColor];
    [self.reserveView.payBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.reserveView.priceBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.reserveView.model = model;
    [self.view addSubview:self.reserveView];
    
    [self setBelowButtonTitle:@"预付款"];
    
}

-(void)btnClick:(UIButton *)sender{
    
    if (sender.tag == 1) {
        NSLog(@"11111111");
    }else if(sender.tag == 2){
        self.windowView = [[MSWindosView  alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        //        if (2) {
        //            //司机
        self.windowView.type = 1;
        self.windowView.isPay = YES;
        self.windowView.delegate = self;
        [self.view addSubview:self.windowView];
        
        MSComModel *comModel = [[MSComModel alloc]init];
        comModel.arecs = @[@"支付宝",@"微信",@"默认余额付款"];
        comModel.title = @"支付方式";
        self.windowView.model = comModel;
        self.windowView.backView2.frame = CGRectMake(SCREEN_WIDTH/2-140, 244-64, 280,self.windowView.backView2.frame.size.height);
    }

}

//实现代理
-(void)msWindowsViewSendMSWindows:(NSInteger)tag{
    
    MSComModel *comModel = [[MSComModel alloc]init];
    //要保存的数据
    NSString *st = comModel.arecs[tag];
 
    model.pay = st;
    
    [self.windowView removeFromSuperview];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
