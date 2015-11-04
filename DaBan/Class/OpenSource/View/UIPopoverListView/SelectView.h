//
//  CreateTripViewController.m
//  LingYou
//
//  Created by sky on 15-2-10.
//  Copyright (c) 2015年 sky. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^SelectBlock)(NSMutableDictionary *selectDict);

@interface SelectView : UIView


/**
 *  表视图
 */
@property (nonatomic, strong) UITableView *mainTableView;

/**
 *  回调Block
 */
@property (nonatomic, strong) SelectBlock selectBlock;

/**
 *  数组
 */
@property (nonatomic, strong) NSArray *datasource;

@property (nonatomic, strong) NSArray *datasourceID;

/**
 *  一个可变字典用于保存回传信息; name表示回传cell上得text, index 表示所在cell的indexPath
 */
@property (nonatomic, strong) NSMutableDictionary *blockDictionary;

- (instancetype)initWithFrame: (CGRect)frame andSelectBlock: (SelectBlock) selectBlock;


/**
 *  @brief: 设置表视图
 *
 *  @param: 无
 *  @return:无
 */
- (void) setMainTableView;

@end

