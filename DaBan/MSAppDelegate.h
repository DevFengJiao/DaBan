//
//  MSAppDelegate.h
//  DaBan
//
//  Created by qkm on 15-7-30.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "Defines.h"
#import "DefineString.h"
#import "MSBeseViewController.h"
#import "MSMyViewController.h"
#import "MSTravelViewController.h"
#import <CoreLocation/CoreLocation.h>


@interface MSAppDelegate : UIResponder <UIApplicationDelegate,UIScrollViewDelegate,CLLocationManagerDelegate>
{
    UIImageView *headlogoView;
    UIImageView *footlogoView;
    
    UIScrollView *myscrollView;
    UIPageControl *myPageControl;
    NSArray *arrImages;
    CGRect Curbounds;

}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MainViewController *mainVC;
@property (strong, nonatomic) CLLocationManager *locManager;
@end
