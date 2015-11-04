//
//  MSLineAddViewController.m
//  DaBan
//
//  Created by qkm on 15-8-14.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSLineAddViewController.h"
#import "MSLineAdd.h"
#import "MSWindosView.h"
#import "MSComModel.h"
#import "MSAddMapViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchAPI.h>
#import <MAMapKit/MAUserLocation.h>
#import <MAMapKit/MAAnnotation.h>
#import <MAMapKit/MAAnnotationView.h>
#import <MAMapKit/MAMapServices.h>
#import <MAMapKit/MAMapView.h>

@interface MSLineAddViewController ()<MSWindowsDelegate,MSLineAddDelegate,AddMapViewControllerDelegate,AMapSearchDelegate,MAMapViewDelegate>

{
    CLLocationDegrees  latitudeStart;
    CLLocationDegrees  longitudeStart;
    CLLocationDegrees  latitudeEnd;
    CLLocationDegrees  longitudeEnd;
     AMapSearchAPI *_search;
    
    MAMapPoint current;
    //第二个坐标
    MAMapPoint before;
    //二点之间的距离
    CLLocationDistance length;
    
    NSURL *myUrl;
}

@property (nonatomic, strong)MSComModel     *winV;
@property (nonatomic, strong)MSWindosView   *windowView;
@property (nonatomic, strong)MSLineAdd      *line;
@property (nonatomic, strong)UIView         *addView;
@property (nonatomic, strong)MSLineModel    *lineModel;
@end

@implementation MSLineAddViewController

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
//    [self navigation];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发布线路";

  
//    self.lineModel = [[MSLineModel alloc]init];
//    
//    self.line = [[MSLineAdd alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    self.line.delegate = self;
//    [self.line.endBtn addTarget:self action:@selector(endClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.line.startBtn addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.line.bgV4 addTarget:self action:@selector(speakClick) forControlEvents:UIControlEventTouchUpInside];
//    //立即发布
//    [self.line.addBtn addTarget:self action:@selector(addBtnClick) forControlEvents:UIControlEventTouchUpInside];
//
//    [self.view addSubview:self.line];

}

-(void)navigation{
    
    _search = [[AMapSearchAPI alloc] initWithSearchKey:kMAPKey Delegate:self];
    
    //构造AMapNavigationSearchRequest对象，配置查询参数
    AMapNavigationSearchRequest *naviRequest= [[AMapNavigationSearchRequest alloc] init];
    naviRequest.searchType = AMapSearchType_NaviDrive;
    naviRequest.requireExtension = YES;
    naviRequest.origin = [AMapGeoPoint locationWithLatitude:latitudeStart longitude:longitudeStart];
    naviRequest.destination = [AMapGeoPoint locationWithLatitude:latitudeEnd longitude:longitudeEnd];
    
    NSLog(@"--%.6f--%.6f",latitudeStart,longitudeStart);
    NSLog(@"--%.6f--%.6f",latitudeEnd,longitudeEnd);
    //发起路径搜索
    [_search AMapNavigationSearch: naviRequest];

}

//实现路径搜索的回调函数
- (void)onNavigationSearchDone:(AMapNavigationSearchRequest *)request response:(AMapNavigationSearchResponse *)response
{
    if(response.route == nil)
    {
        return;
    }
    
    //通过AMapNavigationSearchResponse对象处理搜索结果
    NSString *route = [NSString stringWithFormat:@"Navi: %@", response.route];
    NSLog(@"%@", route);
}

-(void)addMapViewControllerDelegate:(NSString *)title andTag:(int)tag andlatitude:(CGFloat)latitude andLongitude:(CGFloat)longitude{

    
    
    if (tag == 1) {
        [self.line.endBtn setTitle:title forState:UIControlStateNormal];
        [self.line.endBtn setTitleColor:ZICOLOR forState:UIControlStateNormal];
        self.lineModel.startAddr  = title;
        latitudeStart    = latitude;
        longitudeStart   = longitude;
        current = MAMapPointForCoordinate(CLLocationCoordinate2DMake(latitude, longitude));
//        NSLog(@"1---%f-%f",longitudeStart,latitude);
    }else if (tag == 2){
        [self.line.startBtn setTitle:title forState:UIControlStateNormal];
        [self.line.startBtn setTitleColor:ZICOLOR forState:UIControlStateNormal];
        self.lineModel.endAddr   = title;
        latitudeEnd     = latitude;
        longitudeEnd    = longitude;
        before = MAMapPointForCoordinate(CLLocationCoordinate2DMake(latitude, longitude));
//        NSLog(@"2--%f--%f",longitudeEnd,latitude);
    }
    
    if (latitudeStart>1&&longitudeStart>1&&latitudeEnd>1&&longitudeEnd>1) {
        length = MAMetersBetweenMapPoints(current, before);
          [self requestPrice];
        NSLog(@"3--------%f",length);
    }
  
    
}

-(void)endClick{
    MSAddMapViewController *map = [[MSAddMapViewController alloc]init];
    map.pagTag = 1;
    map.delegate = self;
    [self.navigationController pushViewController:map animated:YES];

}
-(void)startClick{
    MSAddMapViewController *map = [[MSAddMapViewController alloc]init];
    map.pagTag = 2;
    map.delegate = self;
    [self.navigationController pushViewController:map animated:YES];

}

-(void)speakClick{
    
    self.windowView = [[MSWindosView  alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.windowView.delegate = self;
    [self.view addSubview:self.windowView];
    
    MSComModel *model = [[MSComModel alloc]init];
    model.arecs = @[@"无",@"孕妇",@"带宠物",@"多人出行"];
    model.title = @"捎句话";
    self.windowView.model = model;
    self.windowView.backView2.frame = CGRectMake(20, 351/2-64, SCREEN_WIDTH-40, 434/2);

}
-(void)addBtnClick{
    
    [self requestCreate];

//    self.addView = [[UIView alloc]initWithFrame:CGRectMake(35, 518/2-64, SCREEN_WIDTH-70, 50)];
//    self.addView.layer.cornerRadius = 2;
//    self.addView.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5];
//    [self.view addSubview:self.addView];
//    
//    UILabel *zilab = [[UILabel   alloc]initWithFrame:CGRectMake(0, 0, self.addView.frame.size.width, 25)];
//    zilab.backgroundColor = [UIColor clearColor];
//    zilab.textColor = [UIColor whiteColor];
//    zilab.textAlignment = NSTextAlignmentCenter;
//    zilab.font = [UIFont systemFontOfSize:15.0];
//    zilab.text = @"发布成功";
//    [self.addView addSubview:zilab];
//    
//    UILabel *zilab2 = [[UILabel   alloc]initWithFrame:CGRectMake(0, 25, self.addView.frame.size.width, 25)];
//    zilab2.backgroundColor = [UIColor clearColor];
//    zilab2.textColor = [UIColor whiteColor];
//    zilab2.textAlignment = NSTextAlignmentCenter;
//    zilab2.font = [UIFont systemFontOfSize:15.0];
//    zilab2.text = @"请等待系统匹配";
//    [self.addView addSubview:zilab2];
}


//实现代理
-(void)msWindowsViewSendMSWindows:(NSInteger)tag{

    MSComModel *model = [[MSComModel alloc]init];
    self.line.conentLab1.text = model.arecs[tag];
    [self.windowView removeFromSuperview];
    
}

-(void)mslineAddDelegate:(NSString *)str and:(NSString *)str2 adn:(NSString *)str3{

    NSLog(@"str:%@  str2:%@  str3:%@",str,str2,str3);
}

-(void)mslineAddDelegate:(int)startTime{
    self.lineModel.start_time = startTime;
    NSLog(@"startTime---%d",startTime);
}

#pragma -mark
#pragma -mark Request
//价格计算
-(void)requestPrice{

    NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:@"session_token"];
    
    NSString *url1 = [url stringByReplacingOccurrencesOfString:@"+" withString:@"%2b"];
    
    NSString *url2 = [url1 stringByReplacingOccurrencesOfString:@"/" withString:@"%2f"];
    
    NSString *url3 = [url2 stringByReplacingOccurrencesOfString:@"=" withString:@"%3d"];
    
    NSURL *url4 = [NSURL URLWithString:[NSString stringWithFormat:@"%@price_calculate?token=%@&start_lat=%f&start_lng=%f&end_lat=%f&end_lng=%f&route_length=%f",DaBan_URL,url3,latitudeStart,longitudeStart,latitudeEnd,longitudeEnd,length/1000]];
    
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
            NSDictionary *dic = [MSThird dictionaryWithJsonString:result[@"data"]];
            MSLineModel *model = [[MSLineModel alloc]init];
            model.price = [[dic objectForKey:@"price"]doubleValue];
            model.length = length/1000;
            self.line.modelLine = model;
        }else {
            
            [self showMyMessage:@"接口异常!"];
        }
        NSLog(@"TEXT: %@",response);
    }

}
//行程创建
-(void)requestCreate{
   
    
    NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:@"session_token"];
    
    NSString *url1 = [url stringByReplacingOccurrencesOfString:@"+" withString:@"%2b"];
    
    NSString *url2 = [url1 stringByReplacingOccurrencesOfString:@"/" withString:@"%2f"];
    
    NSString *url3 = [url2 stringByReplacingOccurrencesOfString:@"=" withString:@"%3d"];
//    int i = 1;
//   
//    if (i ==1) {
    NSLog(@"%f--%f--%f--%f",latitudeStart,longitudeStart,latitudeEnd,longitudeEnd);
    NSLog(@"%@--%@--%d--%@--%d",self.lineModel.startAddr,self.lineModel.endAddr,[self.line.moneyLab3.text intValue],self.line.conentLab1.text,self.lineModel.start_time);
         myUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@route_create?token=%@&start_lat=%f&start_lng=%f&end_lat=%f&end_lng=%f&start_addr=%@&end_addr=%@&route_fee=%d&msg=%@&role=1&start_time=%d",DaBan_URL,url3,latitudeStart,longitudeStart,latitudeEnd,longitudeEnd,self.lineModel.startAddr,self.lineModel.endAddr,[self.line.moneyLab3.text intValue],self.line.conentLab1.text,0]];
//    }else{
//         myUrl = [NSURL URLWithString:[NSString stringWithFormat:@"%@route_create?token=%@&start_lat=%f&start_lng=%f&end_lat=%f&end_lng=%f&start_addr=%@&end_addr=%@&route_fee=%d&role=1&start_time=%d",DaBan_URL,url3,latitudeStart,longitudeStart,latitudeEnd,longitudeEnd,self.lineModel.startAddr,self.lineModel.endAddr,(int)self.lineModel.price,self.lineModel.start_time]];
//    }
    
    NSLog(@"myUrl---%@",myUrl);
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:myUrl];
    
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
//            NSDictionary *dic = [MSThird dictionaryWithJsonString:result[@"data"]];
//            MSLineModel *model = [[MSLineModel alloc]init];
//            model.price = [[dic objectForKey:@"price"]doubleValue];
//            model.length = length/1000;
//            self.line.modelLine = model;
        }else {
            
            [self showMyMessage:@"接口异常!"];
        }
        NSLog(@"TEXT: %@",response);
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
