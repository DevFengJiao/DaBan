//
//  UIPopoverListView.h
//  UIPopoverListViewDemo
//
//  Created by su xinde on 13-3-13.
//  Copyright (c) 2013年 su xinde. All rights reserved.
//

@class UIPopoverListView;

@protocol UIPopoverListViewDataSource <NSObject>
@required

- (UITableViewCell *)popoverListView:(UIPopoverListView *)popoverListView cellForIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)popoverListView:(UIPopoverListView *)popoverListView numberOfRowsInSection:(NSInteger)section;

-(NSInteger)popoverListView:(UIPopoverListView *)popoverListView  rowIn:(NSInteger)row;

//subViews
//- (UITableViewCell *)popoverSubListView:(UIPopoverListView *)popoverListView cellForIndexPath:(NSIndexPath *)indexPath;
//- (NSInteger)popoverSubListView:(UIPopoverListView *)popoverListView numberOfRowsInSection:(NSInteger)section;
@end

@protocol UIPopoverListViewDelegate <NSObject>
@optional

- (void)popoverListView:(UIPopoverListView *)popoverListView didSelectIndexPath:(NSIndexPath *)indexPath;

- (void)popoverListViewCancel:(UIPopoverListView *)popoverListView;

- (CGFloat)popoverListView:(UIPopoverListView *)popoverListView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)popoverListView:(UIPopoverListView *)popoverListView heightFooter:(NSInteger)section;

- (CGFloat)popoverListView:(UIPopoverListView *)popoverListView heightHeader:(NSInteger)section;

-(void)popoverListViewDidPopBack:(UIPopoverListView *)popoverListView;

//subViews
- (void)popoverSubListView:(UIPopoverListView *)popoverListView didSelectIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)popoverSubListView:(UIPopoverListView *)popoverListView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
@end


@interface UIPopoverListView : UIView <UITableViewDataSource, UITableViewDelegate>
{
    UITableView *_listView;
    UILabel     *_titleView;
    UIControl   *_overlayView;
    
    id<UIPopoverListViewDataSource> _datasource;
    id<UIPopoverListViewDelegate>   _delegate;
    
}

@property (nonatomic, assign) id<UIPopoverListViewDataSource> datasource;
@property (nonatomic, assign) id<UIPopoverListViewDelegate>   delegate;

@property (nonatomic, retain) UITableView *listView;

- (void)defalutInit;
- (void)setTitle:(NSString *)title;

- (void)show;
- (void)dismiss;

@end
