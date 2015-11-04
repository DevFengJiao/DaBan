//
//  MSWindosView.h
//  DaBan
//
//  Created by qkm on 15-8-14.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSBaseView.h"
#import "MSComModel.h"

@protocol MSWindowsDelegate <NSObject>
@required
-(void)msWindowsViewSendMSWindows:(NSInteger)tag;
@optional
-(void)addPeopleWindowsView :(NSInteger)tag;

@end


@interface MSWindosView : MSBaseView

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIView *backView2;

@property (nonatomic, strong) UIView *titleView;

@property (nonatomic, strong) NSArray *arecArrays;

@property (nonatomic, strong)  UILabel *title;
@property (nonatomic, strong) UIButton  *imageButton;
//tag 100 是加 101 是减
@property (nonatomic, strong) UIButton  *peopleBtn;
@property (nonatomic, strong) UIButton  *peopleBtn2;

@property (nonatomic, strong) MSComModel *model;
@property (nonatomic, assign) NSInteger  type;
@property (nonatomic, assign) BOOL       isPay;

@property (nonatomic, strong) UILabel *peoplelab2;

@property (nonatomic, assign) id<MSWindowsDelegate>delegate;
@end
