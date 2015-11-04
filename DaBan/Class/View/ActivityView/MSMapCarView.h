//
//  MSMapCarView.h
//  DaBan
//
//  Created by qkm on 15-8-27.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSBaseView.h"
#import "MSCarModel.h"

//view  的高度是192
@interface MSMapCarView : MSBaseView
@property (nonatomic, strong) UIButton      *canBtn;
@property (nonatomic, strong) UIButton      *sureBtn;
@property (nonatomic, strong) EGOImageView  *imageView;
@property (nonatomic, strong) UILabel       *nameLab;
@property (nonatomic, strong) UILabel       *carNumLab;
@property (nonatomic, strong) UILabel       *carModelsLab;
@property (nonatomic, strong) UILabel       *carColorLab;
@property (nonatomic, strong) UILabel       *peopleLab;
@property (nonatomic, strong) UILabel       *comLab;
@property (nonatomic, strong) UIImageView   *sexImageView;

@property (nonatomic, strong) MSCarModel    *model;
@end
