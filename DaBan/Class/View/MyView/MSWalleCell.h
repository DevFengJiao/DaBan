//
//  MSWalleCell.h
//  DaBan
//
//  Created by qkm on 15-8-19.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSWalletModel.h"
@interface MSWalleCell : UITableViewCell

@property (nonatomic, strong) UIImageView       *imagV;
@property (nonatomic, strong) UILabel           *titleLab;
@property (nonatomic, strong) MSWalletModel     *model;
@end
