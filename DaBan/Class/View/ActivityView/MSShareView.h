//
//  MSShareView.h
//  DaBan
//
//  Created by qkm on 15-9-15.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSBaseView.h"

@protocol MSShareViewDelegate <NSObject>

-(void)msShareViewDelegate:(NSInteger)tag;

@end

@interface MSShareView : MSBaseView

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIView *backView2;
@property (nonatomic, strong) UIButton  *shareBtn;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UIButton  *cancelBtn;

@property (nonatomic,assign) id<MSShareViewDelegate> delegate;
@end
