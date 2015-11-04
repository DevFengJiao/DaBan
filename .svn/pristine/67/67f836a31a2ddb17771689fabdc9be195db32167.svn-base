//
//  MSActivityDetailViewController.m
//  DaBan
//
//  Created by qkm on 15-8-24.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSActivityDetailViewController.h"
#import "MSActivityModel.h"
#import "MSActivityTableViewCell.h"
#import "MSActivityDetailView.h"
#import "MSWindosView.h"
#import "MSComModel.h"
#import "MSLoginViewController.h"
#import "MSAddMapViewController.h"
#import "MSMapCarView.h"
#import "MSAddLineViewController.h"
#import "MSAddMapTwoViewController.h"
#import "MSShareView.h"
#import "UMSocial.h"


@interface MSActivityDetailViewController ()<UITableViewDataSource,UITableViewDelegate,MSWindowsDelegate,UIGestureRecognizerDelegate,MSShareViewDelegate,UMSocialDataDelegate,UMSocialUIDelegate>
{
    UITableView *mainTabelView;
    NSArray *mArray;
}
@property (nonatomic, strong) MSWindosView *windowView;
@property (nonatomic, strong) MSActivityModel *activityModel;
@property (nonatomic, strong) MSShareView *shareView;
@property (nonatomic, strong) UIButton  *nextBtn;
@property (nonatomic, assign) NSInteger  people;
@end

@implementation MSActivityDetailViewController

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"活动详情";
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"peopleBool"])
    {
        self.people = 1;
    }
    else
    {
        self.people = [[NSUserDefaults standardUserDefaults]integerForKey:@"people"];
    }

//    [self drawTableView];
    [self initUI];
    
    [self drawHeadView];
    [self setBelowButtonTitle:@"我要参加"];
}

-(void)initUI{
    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
    iv.backgroundColor = [UIColor clearColor];
    iv.image = [UIImage imageNamed:@"my_bgImgV.png"];
    [self.view addSubview:iv];
}

-(void)drawTableView{
//    mainTabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
//    mainTabelView.delegate = self;
//    mainTabelView.dataSource = self;
//    mainTabelView.scrollEnabled = NO;
//    mainTabelView.backgroundColor = [UIColor clearColor];
//    mainTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    [self.view addSubview:mainTabelView];
}

-(void)drawHeadView{
    self.activityModel = [[MSActivityModel alloc]init];
    self.activityModel.time = @"1989-03-55";
    self.activityModel.title  = @"深圳大学城演唱会";
    self.activityModel.conent = @"呀呀中保持载客黔东南鞋架基地呀呀呀中保持载客黔东南鞋架基地呀呀呀中保持载客黔东南鞋架基地呀";
    self.activityModel.addr = @"深大地铁";
    
    MSActivityDetailView *detailView = [[MSActivityDetailView alloc]init];
    detailView.model = self.activityModel;
    detailView.frame = CGRectMake(0, 120, SCREEN_WIDTH, SCREEN_HEIGHT-120);
    if (YES) {
        [detailView.collectBtn setImage:[UIImage imageNamed:@"01-3喜欢-激活.png"] forState:UIControlStateNormal];
    }else{
        [detailView.collectBtn setImage:[UIImage imageNamed:@"01-3喜欢"] forState:UIControlStateNormal];
    }
    [detailView.shareBtn addTarget:self action:@selector(shareBtn) forControlEvents:UIControlEventTouchUpInside];
    [detailView.collectBtn addTarget:self action:@selector(collectBtn) forControlEvents:UIControlEventTouchUpInside];
    
    detailView.conentLab.numberOfLines = 0;
    CGSize  size = [detailView.conentLab sizeThatFits:CGSizeMake(detailView.conentLab.frame.size.width, MAXFLOAT)];
    //放在view层没有效果，不知道为什么
    detailView.conentLab.frame = CGRectMake(detailView.conentLab.frame.origin.x, detailView.conentLab.frame.origin.y,SCREEN_WIDTH-20, size.height);
    
    [self.view addSubview:detailView];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
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
    model.time = @"2013-8-2";
    model.image = @"my_bgImgV";
    model.title = @"天读止可进国框架夲";
    model.addr  = @"深圳11111";
    cell.model = model;

    return cell;
}

#pragma -mark

-(void)belowBtnClick{
    NSString *st = [[NSUserDefaults standardUserDefaults] objectForKey :@"USERID"];
    //如果已经登录
    
    if (!NULL_STR(st)) {
        self.windowView = [[MSWindosView  alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//        if (2) {
//            //司机
        
    
        if ([ROLELAB isEqualToString:@"我是车主"]) {
            self.windowView.type = 1;
        }else{
            //乘客
             self.windowView.type = 2;
        }
    
        self.windowView.delegate = self;
        [self.view addSubview:self.windowView];
        
        MSComModel *model = [[MSComModel alloc]init];
        model.arecs = @[@"8月26日",@"8月27日",@"8月28日",@"8月29日"];
        model.title = @"参加的场次人数";
        model.people = self.people;
        NSLog(@"------%d",self.people);
        self.windowView.model = model;
        self.windowView.backView2.frame = CGRectMake(self.windowView.backView2.frame.origin.x   , 100, self.windowView.backView2.frame.size.width,self.windowView.backView2.frame.size.height);
        
    }else{
        MSLoginViewController *log = [[MSLoginViewController alloc]init];
        log.type = 0;
        [self.navigationController pushViewController:log animated:YES];
    }
}

-(void)shareBtn{
    
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:kUMSocialKey
                                      shareText:@"快来领钱啦。。。搭伴创造美好出行"
                                     shareImage:[UIImage imageNamed:@"搭伴icon-108x108.png"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina,UMShareToQzone,nil]
                                       delegate:self];
    
//    self.shareView = [[MSShareView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    self.shareView.delegate = self;
//    [self.view addSubview:self.shareView];
//    
//    [self.shareView.cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];

}

//实现回调方法（可选）：
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的微博平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}

-(void)cancelBtnClick{
    [self.shareView removeFromSuperview];
}
-(void)collectBtn{

}

#pragma -mark

//实现代理
-(void)msWindowsViewSendMSWindows:(NSInteger)tag{
    
    MSComModel *model = [[MSComModel alloc]init];
    //要保存的数据
    NSString *st = model.arecs[tag];
    //1是司机2是乘客
    if (self.windowView.type == 1) {
        MSAddLineViewController *line = [[MSAddLineViewController alloc]init];
        [self.navigationController pushViewController:line animated:YES];
    }else if(self.windowView.type == 2){
    
        MSAddMapTwoViewController *add = [[MSAddMapTwoViewController alloc]init];
        add.addr = self.activityModel.addr;
        [self.navigationController pushViewController:add animated:YES];
    }
   
    
    NSLog(@"场次： %@",st);
    [self.windowView removeFromSuperview];
    
}

-(void)msShareViewDelegate:(NSInteger)tag{
    
   
    NSLog(@"TAG:  %d",tag);
}

-(void)addPeopleWindowsView:(NSInteger)tag{
    //tag 100 是加 101 是减
    if (tag == 100) {
        if (self.people == 1) {
            self.people = self.people;
        }else{
            self.people--;
        }
    }else{
        if (self.people == 3) {
            self.people = self.people;
            [self showMyMessage:@"亲，最多是三人"];
        }else{
            self.people++;
        }
    }
    self.windowView.peoplelab2.text = [NSString stringWithFormat:@"%d",self.people];
    [[NSUserDefaults standardUserDefaults]setInteger:self.people forKey:@"people"];
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"peopleBool"];
    [[NSUserDefaults standardUserDefaults] synchronize];
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
