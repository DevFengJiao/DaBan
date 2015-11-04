//
//  MSAddMapTwoViewController.m
//  DaBan
//
//  Created by qkm on 15-9-9.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSAddMapTwoViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MAMapKit/MAUserLocation.h>
#import <MAMapKit/MAAnnotation.h>
#import <MAMapKit/MAAnnotationView.h>
#import <MAMapKit/MAMapServices.h>
#import <MAMapKit/MAMapView.h>
#import <AMapSearchKit/AMapSearchAPI.h>
#import "MSMapCarView.h"
#import "MSReserveViewController.h"

#import "MSCustomAnnotaionView.h"

@interface MSAddMapTwoViewController ()<MAMapViewDelegate,UITableViewDataSource,UITableViewDelegate,AMapSearchDelegate>
{
    MAMapView          *_mapView;
    AMapSearchAPI      *_search;
    NSMutableArray     *myCodeArrays;
    
    CLLocationDegrees  latitude;
    CLLocationDegrees  longitude;
    
    CLLocationDegrees  latitudeTwo;
    CLLocationDegrees  longitudeTwo;
    NSArray            *myAnnotations;
    NSString           *city;
}
@property (nonatomic, strong) MSMapCarView *mapCarView;
@property (nonatomic, strong) MSCarModel   *carModel;

@end


@implementation MSAddMapTwoViewController

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc]init];
    //    [_mapView addAnnotation:pointAnnotation];
    //    [self pointAnnotation];
//    [self navigationSerach];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"附近车主";
    
    [MAMapServices sharedServices].apiKey = kMAPKey;
    _mapView = [[MAMapView alloc]init];
    _mapView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    _mapView.showsUserLocation = YES;
    _mapView.delegate = self;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
    _mapView.customizeUserLocationAccuracyCircleRepresentation = YES;
    _mapView.rotateEnabled= NO;    //NO表示禁用旋转手势，YES表示开启
    _mapView.rotateCameraEnabled= NO;    //NO表示禁用倾斜手势，YES表示开启
    
    _mapView.showsCompass= NO;
    UIImageView *iv = [[UIImageView alloc]init];
    iv.frame = CGRectMake(_mapView.frame.size.width/2-10,_mapView.frame.size.height/2-64, 20, 30);
    iv.backgroundColor = [UIColor clearColor];
    iv.image = [UIImage imageNamed:@"activity_location_icon.png"];
    [_mapView addSubview:iv];
    
    [self.view addSubview:_mapView];
    
    _search = [[AMapSearchAPI alloc]initWithSearchKey:kMAPKey Delegate:self];
    _search.language = AMapSearchLanguage_zh_CN;
    

    
    
//    [self headClick];

}
-(void)pointAnnotation{
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(22.540496, 113.949506);
    pointAnnotation.title = @"方恒国际";
    pointAnnotation.subtitle = @"阜通东大街6号";
    [_mapView addAnnotation:pointAnnotation];
    
    MAPointAnnotation *pointAnnotation1 = [[MAPointAnnotation alloc] init];
    pointAnnotation1.coordinate = CLLocationCoordinate2DMake(22.525748, 113.952987);
    pointAnnotation1.title = @"111际";
    pointAnnotation1.subtitle = @"1111街6号";
    [_mapView addAnnotation:pointAnnotation1];
    
    MAPointAnnotation *pointAnnotation2 = [[MAPointAnnotation alloc] init];
    pointAnnotation2.coordinate = CLLocationCoordinate2DMake(22.525796, 113.954987);
    pointAnnotation2.title = @"111际";
    pointAnnotation2.subtitle = @"1111街6号";
    [_mapView addAnnotation:pointAnnotation2];
    
    
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id <MAAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAPointAnnotation class]])
    {
        static NSString *reuseIndetifier = @"annotationReuseIndetifier";
        MSCustomAnnotaionView *annotationView = (MSCustomAnnotaionView *)[mapView dequeueReusableAnnotationViewWithIdentifier:reuseIndetifier];
        if (annotationView == nil)
        {
            annotationView = [[MSCustomAnnotaionView alloc] initWithAnnotation:annotation reuseIdentifier:reuseIndetifier];

        }
        annotationView.image = [UIImage imageNamed:@"activity_location_carHeadImg"];
        
        // 设置为NO，用以调用自定义的calloutView
        annotationView.canShowCallout = NO;
       
        
        // 设置中心点偏移，使得标注底部中间点成为经纬度对应点
        annotationView.centerOffset = CGPointMake(0, -18);
        return annotationView;
    }
    return nil;
    

}




-(void)mapView:(MAMapView *)mapView didSelectAnnotationView:(MAAnnotationView *)view{
    
    [self regeocodeSearchRequest2];
    
    NSArray * array = [NSArray arrayWithArray:_mapView.annotations];
    
    for (int i=0; i<array.count; i++)
        
    {
        if (view.annotation.coordinate.latitude ==((MAPointAnnotation *)array[i]).coordinate.latitude)
            
        {
            
            latitude = view.annotation.coordinate.latitude;
            longitude = view.annotation.coordinate.longitude;
//            //可以拿到当前点击的坐标
//            NSLog(@"%f",view.annotation.coordinate.latitude);
            self.carModel    = [[MSCarModel alloc]init];
              self.carModel.carColor  = @"红色";
              self.carModel.carName   = @"茫茫";
              self.carModel.carNumber = @"湘A";
              self.carModel.carModels = @"宝马X1";
              self.carModel.handImg   = @"xxhdpi.png";
              self.carModel.people    = @"87";
              self.carModel.com       = @"33";
              self.carModel.sex       = 1;
        }else{
           
              self.carModel.carColor  = @"黑色";
              self.carModel.carName   = @"马可";
              self.carModel.carNumber = @"津A";
              self.carModel.carModels = @"大牛978";
              self.carModel.handImg   = @"xxhdpi.png";
              self.carModel.people    = @"4";
              self.carModel.com       = @"33";
              self.carModel.sex       = 1;

            //对其余的大头针进行操作 我是删除
            
            //[_mapView removeAnnotation:array[i]];
            
        }
    }
    
     [self headClick];
    
}


//当位置更新时，会进定位回调，通过回调函数，能获取到定位点的经纬度坐标，示例代码如下：
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation{
    if (updatingLocation) {
        //取出当前位置的坐标
        //        NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
    }
        latitude = userLocation.coordinate.latitude;
        longitude = userLocation.coordinate.longitude;
        [self regeocodeSearchRequest];
}

//地图 的中间位置
-(void)mapView:(MAMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    
//    CLLocationCoordinate2D centerCoordinate = mapView.region.center;
//    
//    
//    latitude = centerCoordinate.latitude;
//    longitude = centerCoordinate.longitude;
//    [self regeocodeSearchRequest];
    [self pointAnnotation];
}


//实现正向地理编码的回调函数
- (void)onGeocodeSearchDone:(AMapGeocodeSearchRequest *)request response:(AMapGeocodeSearchResponse *)response
{
    if(response.geocodes.count == 0)
    {
        return;
    }
    
    //通过AMapGeocodeSearchResponse对象处理搜索结果
    NSString *strGeocodes = @"";
    for (AMapGeocode *p in response.geocodes) {
        strGeocodes = [NSString stringWithFormat:@"geocode: %@",p.location];
        longitudeTwo = p.location.longitude;
        latitudeTwo  = p.location.latitude;
    }
}

//实现逆地理编码的回调函数
-(void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response{
    if (response.regeocode != nil) {
        //通过AMapReGeocodeSearchResponse对象处理搜索结果
        //        NSString *result = [NSString stringWithFormat:@"ReGeocode: %@ \n",response.regeocode];
        
        [myCodeArrays removeAllObjects];
        
        for (AMapPOI *poi in  response.regeocode.pois) {
            [myCodeArrays addObject:poi];
        }
        city         = response.regeocode.addressComponent.city;

    }
    
}

//逆地理编码
-(void)regeocodeSearchRequest{
    AMapReGeocodeSearchRequest *regeoRequest = [[AMapReGeocodeSearchRequest alloc]init
                                                ];
    regeoRequest.searchType = AMapSearchType_ReGeocode;
    // 中心点坐标
    regeoRequest.location = [AMapGeoPoint locationWithLatitude:latitude longitude:longitude];
    regeoRequest.radius = 3000; //[default = 1000]; 查询半径，单位：米
    regeoRequest.requireExtension = YES; //是否返回扩展信息，默认为 NO
    //发起逆地理编码
    [_search AMapReGoecodeSearch:regeoRequest];
}

-(void)regeocodeSearchRequest2{
    
    //构造AMapGeocodeSearchRequest对象，address为必选项，city为可选项
    AMapGeocodeSearchRequest *geoRequest = [[AMapGeocodeSearchRequest alloc] init];
    geoRequest.searchType = AMapSearchType_Geocode;
    geoRequest.address = self.addr;
     NSLog(@"city:%@ addr:%@",city,self.addr);
    geoRequest.city = @[city];
   
    //发起正向地理编码
    [_search AMapGeocodeSearch: geoRequest];
}

-(void)headClick{

    _mapCarView = [[MSMapCarView alloc]init];
    _mapCarView.frame = CGRectMake(0, self.view.bounds.size.height-62, SCREEN_WIDTH, 192);
    _mapCarView.backgroundColor = [UIColor whiteColor];
    [UIView animateWithDuration:0.5 animations:^{
        _mapCarView.frame = CGRectMake(_mapCarView.frame.origin.x, SCREEN_HEIGHT-192-62, _mapCarView.frame.size.width, _mapCarView.frame.size.height);
    }];
    _mapCarView.model =   self.carModel;
    
    [_mapCarView.canBtn addTarget:self action:@selector(mapBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [_mapCarView.sureBtn addTarget:self action:@selector(mapBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_mapCarView];
}





//can.tag =1  sure.tag = 2
-(void)mapBtnClick: (UIButton *)sender{
    
    if (sender.tag == 2) {
        //1.将两个经纬度点转成投影点
        MAMapPoint point1 = MAMapPointForCoordinate(CLLocationCoordinate2DMake(latitude,longitude));
        MAMapPoint point2 = MAMapPointForCoordinate(CLLocationCoordinate2DMake(latitudeTwo,longitudeTwo));
        //2.计算距离
        CLLocationDistance distance = MAMetersBetweenMapPoints(point1,point2);
        
        NSLog(@"%f--%f--%f--%f--%f",latitude,longitude,latitudeTwo,longitudeTwo,distance);
        
        MSReserveViewController *reserver = [[MSReserveViewController alloc]init];
        reserver.distance = distance/1000;
        [self.navigationController pushViewController:reserver animated:YES];
    }else{
        [UIView animateWithDuration:0.3 animations:^{
            _mapCarView.frame = CGRectMake(_mapCarView.frame.origin.x, SCREEN_HEIGHT-62, _mapCarView.frame.size.width, _mapCarView.frame.size.height);
        }];
        
    }
    
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:0.3 animations:^{
        _mapCarView.frame = CGRectMake(_mapCarView.frame.origin.x, SCREEN_HEIGHT-62, _mapCarView.frame.size.width, _mapCarView.frame.size.height);
    }];
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
