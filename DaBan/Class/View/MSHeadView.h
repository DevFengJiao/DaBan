//
//  MSHeadView.h
//  DaBan
//
//  Created by qkm on 15-8-5.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSUserModel.h"


@protocol MSHeadViewDelegate <NSObject>

-(void)getTheGuideInfo;

@end


@interface MSHeadView : UIView


@property (nonatomic,strong)EGOImageView     *headImgV;
@property (nonatomic,strong)UILabel         *headLabel;
@property (nonatomic,strong)UIImageView     *sexImageView;
@property (nonatomic,strong)MSUserModel     *model;
@end
