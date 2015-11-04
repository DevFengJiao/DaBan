//
//  UmRefreshView.m
//  TestWebRefresh
//
//  Created by ZhangWeiXin on 15-5-20.
//  Copyright (c) 2012年 Seven. All rights reserved.
//

#import "UmRefreshView.h"
#import "PullToRefreshView.h"
#import <QuartzCore/QuartzCore.h>

@interface UmRefreshView()<UIScrollViewDelegate,PullToRefreshViewDelegate>

@property(nonatomic, assign) UIScrollView* currentScrollView;
@property(nonatomic, retain) PullToRefreshView *refresh;
@end

@implementation UmRefreshView
@synthesize currentScrollView;
@synthesize refresh;
@synthesize dataSource;

-(id) init
{
    if (self = [super init])
    {
        [self setRefresh];
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)coder
{
    if (self = [super initWithCoder:coder])
    {
        [self setRefresh];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame;
{
    if ( self = [super initWithFrame:frame])
    {
        [self setRefresh];
    }
    return self;
}

- (void) dealloc
{
    [refresh containingViewDidUnload];
}

-(void)setRefresh
{
    //去除阴影
    self.scalesPageToFit = NO;
    self.autoresizingMask =  UIViewAutoresizingNone;
    self.backgroundColor = [UIColor clearColor];
    self.opaque = NO;
    for (UIView *subView in [self subviews])
    {
        if ([subView isKindOfClass:[UIScrollView class]])
        {
            currentScrollView = (UIScrollView *)subView;
            currentScrollView.delegate = self;
            for (UIView *shadowView in [subView subviews])
            {
                if ([shadowView isKindOfClass:[UIImageView class]])
                {
                    shadowView.hidden = YES;
                }
            }
        }
    }
    self.refresh = [[PullToRefreshView alloc] initWithScrollView:currentScrollView];
    self.refresh.delegate = self;
    [currentScrollView addSubview:refresh];
    
    [self.refresh readyForLoading];
}



- (void)beginLoading
{
    [self.refresh beginLoading];
}

- (void)finishedLoading
{
    [self.refresh finishedLoading];
}

#pragma mark - UIScrollViewDelegate



#pragma mark - PullToRefreshViewDelegate

- (void)pullToRefreshViewShouldRefresh:(PullToRefreshView *)view
{
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(pullToRefreshViewShouldRefresh:)])
    {
        [self.dataSource pullToRefreshViewShouldRefresh:self];
    }
}

//- (NSDate *)pullToRefreshViewLastUpdated:(PullToRefreshView *)view
//{
//    return [NSDate date];
//}

@end
