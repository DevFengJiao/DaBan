//
//  MSLineAdd.h
//  DaBan
//
//  Created by qkm on 15-8-14.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSBaseView.h"
#import "MSLineModel.h"
#import "MSWindosView.h"

@protocol MSLineAddDelegate <NSObject>

- (void)mslineAddDelegate:(NSString *)str and:(NSString *)str2 adn:(NSString *)str3;

- (void)mslineAddDelegate:(int)startTime;

@end

@interface MSLineAdd : MSBaseView <UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>

@property(nonatomic, assign) id<MSLineAddDelegate>delegate;
@property(nonatomic, strong) UIButton       *endBtn;
@property(nonatomic ,strong) UIButton       *startBtn;
@property(nonatomic, strong) UILabel        *moneyLab2;
@property(nonatomic, strong) UILabel        *moneyLab3;
@property(nonatomic, strong) UIImageView    *endImageV;
@property(nonatomic, strong) UITextField    *endTextField;

@property(nonatomic, strong) UIImageView    *startImageV;
@property(nonatomic, strong) UITextField    *startField;

@property(nonatomic, strong) UIImageView    *bgV2;
@property(nonatomic, strong) UIView         *colorView;
@property(nonatomic, strong) UIView         *colorView2;
@property(nonatomic, strong) UIButton       *addBtn;

@property(nonatomic, strong) UIButton       *bgV4;
@property(nonatomic, strong) MSWindosView   *winV;

@property(nonatomic, strong) UILabel        *conentLab1;
@property(nonatomic, strong) MSLineModel    *modelLine;


@property (nonatomic, strong)NSArray    *days;
@property (nonatomic, strong)NSArray    *hours;
@property (nonatomic, strong)NSArray    *mins;
@property (nonatomic, strong)UIPickerView *pickView;
@property (nonatomic, strong)UIDatePicker *dataPicker;
@end
