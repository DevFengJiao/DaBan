//
//  MSScrollView.h
//  DaBan
//
//  Created by qkm on 15-8-11.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSBaseView.h"
#import "SwipeView.h"

@interface MSScrollView : MSBaseView<UIScrollViewDelegate,SwipeViewDataSource,SwipeViewDelegate>
{
    UIImageView *headlogoView;
    UIImageView *footlogoView;
    UIScrollView *myscrollView;
    UIPageControl *myPageControl;
    NSArray *arrImages;
    CGRect Curbounds;
    BOOL _ignoreAutoSwipeOnce;
    SwipeView    *_swipeView;
    UIPageControl *_pageController;
    NSArray  *pagesArray;

}

@property(nonatomic, strong)UIScrollView *mainScrollView;


@end
