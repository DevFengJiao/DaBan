//
//  MSReserveView.h
//  DaBan
//
//  Created by qkm on 15-8-27.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSBaseView.h"
#import "MSActivityModel.h"

@interface MSReserveView : MSBaseView
@property (nonatomic, strong) UIImageView *bgImgV;
@property (nonatomic, strong) UILabel     *nameLab;
@property (nonatomic, strong) UILabel     *rangeLab;
@property (nonatomic, strong) UILabel     *timeLab;
@property (nonatomic, strong) UIButton    *priceBtn;
@property (nonatomic, strong) UIButton    *payBtn;
@property (nonatomic, strong) UILabel     *pciceLab;
@property (nonatomic, strong) UILabel     *payLab2;

@property (nonatomic, strong) UILabel       *myName;
@property (nonatomic, strong) EGOImageView  *myHeadImageView;
@property (nonatomic, strong) UIImageView   *sexImageView;

@property (nonatomic, strong) MSActivityModel *model;
@end
