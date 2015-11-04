//
//  UmRefreshView.h
//  
//
//  Created by ZhangWeiXin on 15-5-20.
//  Copyright (c) 2012年 Seven. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UmRefreshView;

@protocol UmRefreshViewDelegate <NSObject>

@optional
- (void)pullToRefreshViewShouldRefresh:(UmRefreshView *)view;

@end

@interface UmRefreshView : UIWebView

@property (nonatomic ,weak) id<UmRefreshViewDelegate> dataSource;

- (void)finishedLoading;
- (void)beginLoading;

@end
