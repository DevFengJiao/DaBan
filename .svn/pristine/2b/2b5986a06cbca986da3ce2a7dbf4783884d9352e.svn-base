//
//  MSSearchListView.m
//  DaBan
//
//  Created by qkm on 15-9-8.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSSearchListView.h"

@implementation MSSearchListView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self defalutInit];
    }
    return self;
}

- (void)defalutInit
{
    CGFloat xWidth = self.bounds.size.width;
    CGRect tableFrame = CGRectMake(0, 0, xWidth, SCREEN_HEIGHT-62);
    _listView = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStylePlain];
    _listView.dataSource = self;
    _listView.delegate = self;
    _listView.backgroundColor = LINEE;
    _listView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //    _listView.separatorColor = [UIColor colorFromHexString:@"#0xe3e4e6"];
    //    _listView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    //    _listView.layer.borderWidth = 0.0f;
    //    _listView.layer.cornerRadius = 5.0f;
    //    _listView.clipsToBounds = TRUE;
//    _listView.showsVerticalScrollIndicator = NO;
//    _listView.scrollEnabled = NO;
        _listView.userInteractionEnabled = YES;
 
    [self addSubview:_listView];

}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"ffffffffffffff");
    if (self.datasource &&[self.datasource respondsToSelector:@selector(serchListViewWillBeginDecelerating:)]) {
        return [self.datasource serchListViewWillBeginDecelerating:scrollView];
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.datasource &&[self.datasource respondsToSelector:@selector(serchListView:rowIn:)]) {
        return [self.datasource serchListView:self rowIn:section];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.datasource &&[self.datasource respondsToSelector:@selector(serchListView:cellForIndexPath:)]) {
        return [self.datasource serchListView:self cellForIndexPath:indexPath];
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 52;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.delegate &&[self.delegate respondsToSelector:@selector(serchListView:didSelectIndexPath:)]) {
        return [self.delegate serchListView:self didSelectIndexPath:indexPath];
    }
}



@end
