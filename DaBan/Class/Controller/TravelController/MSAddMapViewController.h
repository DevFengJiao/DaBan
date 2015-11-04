//
//  MSAddMapViewController.h
//  DaBan
//
//  Created by qkm on 15-8-15.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSBeseViewController.h"
#import "MSAddLineModel.h"

@protocol AddMapViewControllerDelegate <NSObject>
@required
-(void)addMapViewControllerDelegate:(NSString *)title andTag:(int)tag andlatitude:(CGFloat)latitude andLongitude:(CGFloat)longitude;
@end
@interface MSAddMapViewController : MSBeseViewController

@property (nonatomic ,assign) id<AddMapViewControllerDelegate>delegate;

//用来判断是起点按键还是终点按键 1是终点 2是起点
@property (nonatomic, assign) int pagTag;
//@property (nonatomic, strong) MSAddLineModel *model;
@end
