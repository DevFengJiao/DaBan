//
//  MSSearchListView.h
//  DaBan
//
//  Created by qkm on 15-9-8.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSBaseView.h"

@class MSSearchListView;

@protocol MSSearchListViewDataSource <NSObject>
@required
-(NSInteger)serchListView:(MSSearchListView *)serchListView  rowIn:(NSInteger)row;
-(UITableViewCell *)serchListView:(MSSearchListView *)serchListView cellForIndexPath:(NSIndexPath *)indexPath;

-(void)serchListViewWillBeginDecelerating:(UIScrollView *)scrollView;

@end

@protocol MSSearchListViewDelegate <NSObject>

- (void)serchListView:(MSSearchListView *)serchListView didSelectIndexPath:(NSIndexPath *)indexPath;

@end


@interface MSSearchListView : MSBaseView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, assign) id<MSSearchListViewDataSource> datasource;
@property (nonatomic, assign) id<MSSearchListViewDelegate>   delegate;
@property (nonatomic, strong) UITableView *listView;


@end
