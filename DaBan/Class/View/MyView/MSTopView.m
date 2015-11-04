//
//  MSTopView.m
//  DaBan
//
//  Created by qkm on 15-8-19.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSTopView.h"

@implementation MSTopView

-(id)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
    
}

-(void)setUp{
    self.bgView  = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    self.bgView.backgroundColor = [UIColor whiteColor];
    self.bgView.userInteractionEnabled = YES;
    [self addSubview:self.bgView];
    
    self.ziLab = [[UILabel alloc] init];
    self.ziLab.frame = CGRectMake(10, 10, 100, 15);
    self.ziLab.backgroundColor = [UIColor clearColor];
    self.ziLab.textColor = [UIColor whiteColor];
    self.ziLab.textAlignment = NSTextAlignmentLeft;
    self.ziLab.font = [UIFont fontWithName:@"Helvetica" size:15];
//    [self.bgView addSubview:self.ziLab];
    
    _walletLab = [[UILabel alloc] init];
    _walletLab.frame = CGRectMake(0, 30, SCREEN_WIDTH, 25);
    _walletLab.backgroundColor = [UIColor clearColor];
    _walletLab.textColor = [UIColor colorWithRed:250/255.0 green:150/255.0 blue:0/255.0 alpha:1.0];
    _walletLab.textAlignment = NSTextAlignmentCenter;
    _walletLab.font = [UIFont fontWithName:@"Helvetica" size:24];
    [self.bgView addSubview:_walletLab];
    
    _walletLab2 = [[UILabel alloc] init];
    _walletLab2.frame = CGRectMake(0, 16+20+25, SCREEN_WIDTH, 14);
    _walletLab2.backgroundColor = [UIColor clearColor];
    _walletLab2.textColor = ZIGRAY;
    _walletLab2.textAlignment = NSTextAlignmentCenter;
    _walletLab2.font = [UIFont fontWithName:@"Helvetica" size:14];
    [self.bgView addSubview:_walletLab2];
}

-(void)setModel:(MSWalletModel *)model{
    
    _model = model;
    
  
    _ziLab.text      = model.ziStr;
    _walletLab.text  = model.wallet;
    _walletLab2.text = model.payment;
}

@end
