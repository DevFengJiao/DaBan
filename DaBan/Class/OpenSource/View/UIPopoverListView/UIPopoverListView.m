//
//  UIPopoverListView.m
//  UIPopoverListViewDemo
//
//  Created by su xinde on 13-3-13.
//  Copyright (c) 2013年 su xinde. All rights reserved.
//

#import "UIPopoverListView.h"
#import <QuartzCore/QuartzCore.h>
#import "Colours.h"
#import "DefineString.h"
#import "Defines.h"
#import "Colours.h"
#import "GlobalStyle.h"
//#define FRAME_X_INSET 20.0f
//#define FRAME_Y_INSET 40.0f

@interface UIPopoverListView ()

- (void)defalutInit;
- (void)fadeIn;
- (void)fadeOut;

@end

@implementation UIPopoverListView

@synthesize datasource = _datasource;
@synthesize delegate = _delegate;

@synthesize listView = _listView;

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
//    self.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//    self.layer.borderWidth = 0.0f;
//    self.layer.cornerRadius = 5.0f;
//    self.clipsToBounds = TRUE;
    
    _titleView = [[UILabel alloc] initWithFrame:CGRectZero];
    
    
    
    _titleView.backgroundColor = [UIColor colorWithRed:59./255. green:89./255. blue:152./255. alpha:1.0f];
    
    _titleView.textAlignment = NSTextAlignmentCenter;
    _titleView.textColor = [UIColor whiteColor];
    CGFloat xWidth = self.bounds.size.width;
    _titleView.lineBreakMode = NSLineBreakByTruncatingTail;
    _titleView.frame = CGRectMake(0, 0, xWidth, 18.0f);
   // [self addSubview:_titleView];
    
    if(self.tag == 100)
    {
        _titleView.font = [UIFont boldSystemFontOfSize:18.0f];
    
        _titleView.frame = CGRectMake(0, 0, xWidth, 18.0f);
    }
    else
    {
        _titleView.font = [UIFont systemFontOfSize:12.0f];
    }
    
    
    CGRect tableFrame = CGRectMake(0, 0, xWidth, SCREEN_HEIGHT);
    _listView = [[UITableView alloc] initWithFrame:tableFrame style:UITableViewStyleGrouped];
    _listView.dataSource = self;
    _listView.delegate = self;
    _listView.backgroundColor = [UIColor whiteColor];
    _listView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    _listView.separatorColor = [UIColor colorFromHexString:@"#0xe3e4e6"];
    
//    _listView.layer.borderColor = [[UIColor lightGrayColor] CGColor];
//    _listView.layer.borderWidth = 0.0f;
//    _listView.layer.cornerRadius = 5.0f;
//    _listView.clipsToBounds = TRUE;
    _listView.showsVerticalScrollIndicator = NO;
    _listView.scrollEnabled = NO;
//    _listView.userInteractionEnabled = NO;
//    if ([_listView respondsToSelector:@selector(setSeparatorInset:)])
//        _listView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [self addSubview:_listView];
    
    _overlayView = [[UIControl alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _overlayView.backgroundColor = [UIColor colorWithRed:.16 green:.17 blue:.21 alpha:.5];
    [_overlayView addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark - UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(self.delegate && [self.delegate respondsToSelector:@selector(popoverListView:heightFooter:)]) {
        return [self.delegate popoverListView:self heightFooter:section];
    }
    
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section  {

    if (self.delegate && [self.delegate respondsToSelector:@selector(popoverListView:heightHeader:)]) {
        return [self.delegate popoverListView:self heightHeader:section];
    }
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    if (self.datasource && [self.delegate respondsToSelector:@selector(popoverListView:rowIn:)]) {
        return [self.datasource popoverListView:self rowIn:2];
    }
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(self.datasource &&
       [self.datasource respondsToSelector:@selector(popoverListView:numberOfRowsInSection:)])
    {
        return [self.datasource popoverListView:self numberOfRowsInSection:section];
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.datasource &&
       [self.datasource respondsToSelector:@selector(popoverListView:cellForIndexPath:)])
    {
        return [self.datasource popoverListView:self cellForIndexPath:indexPath];
    }
    return nil;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.delegate &&
       [self.delegate respondsToSelector:@selector(popoverListView:heightForRowAtIndexPath:)])
    {
        return [self.delegate popoverListView:self heightForRowAtIndexPath:indexPath];
    }
    
    return 0.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.delegate &&
       [self.delegate respondsToSelector:@selector(popoverListView:didSelectIndexPath:)])
    {
        [self.delegate popoverListView:self didSelectIndexPath:indexPath];
    }
    
    if(self.tag == 100)
    {
        [self fadeOut];
    }
    else
    {
        [self dismiss];
    }
    
}


#pragma mark - animations

- (void)fadeIn
{
//    self.transform = CGAffineTransformMakeScale(1.3, 1.3);
//    self.alpha = 0;
//    [UIView animateWithDuration:.35 animations:^{
//        self.alpha = 1;
//        self.transform = CGAffineTransformMakeScale(1, 1);
//    }];
    
    self.frame = CGRectMake(SCREEN_WIDTH, 18.0f, self.bounds.size.width, self.bounds.size.height-22.0f);
    self.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        self.alpha = 1;
        self.frame = CGRectMake(SCREEN_WIDTH-self.bounds.size.width, 18, self.bounds.size.width, self.bounds.size.height-22.0f);
    }];
}
- (void)fadeOut
{
    
    [UIView animateWithDuration:.35 animations:^{
//        self.transform = CGAffineTransformMakeScale(1.3, 1.3);
          self.frame = CGRectMake(SCREEN_WIDTH, 18.0f, self.bounds.size.width, self.bounds.size.height-22.0f);
        self.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [_overlayView removeFromSuperview];
            [self removeFromSuperview];
        }
    }];
    
}

- (void)setTitle:(NSString *)title
{
    _titleView.text = title;
}

- (void)show
{
    UIWindow *keywindow = [[UIApplication sharedApplication] keyWindow];
    [keywindow addSubview:_overlayView];
    [keywindow addSubview:self];
    
    //    self.center = CGPointMake(keywindow.bounds.size.width/2.0f,
    //                              keywindow.bounds.size.height/2.0f);
    [self fadeIn];
}

- (void)dismiss
{
    if(self.tag == 100)
    {
        if([self.delegate respondsToSelector:@selector(popoverListViewDidPopBack:)])
        {
            [self.delegate popoverListViewDidPopBack:self];
            [self fadeOut];
        }
    }
    else
    {
        [self fadeOut];
    }
    
}

#define mark - UITouch
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    // tell the delegate the cancellation
    if (self.delegate && [self.delegate respondsToSelector:@selector(popoverListViewCancel:)]) {
        [self.delegate popoverListViewCancel:self];
    }
    
    // dismiss self
    [self dismiss];
}



@end
