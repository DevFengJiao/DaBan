//
//  MSScrollView.m
//  DaBan
//
//  Created by qkm on 15-8-11.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSScrollView.h"

@implementation MSScrollView

-(id)init
{
    self = [super init];
    if (self) {
        [self showIntruScrollView];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self showIntruScrollView];
    }
    return self;
    
}

-(void)showIntruScrollView
{

    pagesArray = @[@"imageGuide1.png",@"imageGuide2.png",@"imageGuide3.png"];
    
    if (!_swipeView) {
        //滚动视图
        _swipeView = [[SwipeView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150.f)];
        _swipeView.delegate = self;
        _swipeView.dataSource = self;
        [self addSubview:_swipeView];
    }
    
    if (!_pageController) {
        //页码指示
        _pageController = [[UIPageControl alloc] initWithFrame:(CGRectMake(0, CGRectGetMaxY(_swipeView.frame)-15, CGRectGetWidth(_swipeView.frame), 15))];
        _pageController.userInteractionEnabled = NO;
        _pageController.numberOfPages = 3;
        _pageController.currentPage = 0;
        _pageController.pageIndicatorTintColor = UIColorFromRGB(0xD7D7D7);
        _pageController.currentPageIndicatorTintColor = [UIColor whiteColor];
    }
    [self addSubview:_pageController];
    [self performSelector:@selector(goNextPage) withObject:nil afterDelay:5.0];

}

#pragma mark - Swipe View Delegate
-(NSInteger)numberOfItemsInSwipeView:(SwipeView *)swipeView{
    return pagesArray.count;
}

-(void)swipeViewCurrentItemIndexDidChange:(SwipeView *)swipeView{
    _pageController.currentPage = swipeView.currentItemIndex;
    _ignoreAutoSwipeOnce = YES;
}

-(UIView *)swipeView:(SwipeView *)swipeView viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    
    
    NSString  *imageName = [pagesArray objectAtIndex:index];
    if (!view) {
        UIView * bannerView = [[UIView alloc] initWithFrame:swipeView.bounds];
        
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:bannerView.bounds];
        imageView.tag = 10000;
        [bannerView addSubview:imageView];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        
        view = bannerView;
    }
    
    UIImageView * imageView = (UIImageView *)[view viewWithTag:10000];
    imageView.image = [UIImage imageNamed:imageName];
    return view;
    
}

- (void)swipeViewDidEndScrollingAnimation:(SwipeView *)swipeView{
    //    NSLog(@"swipeViewDidEndScrollingAnimation");
    _ignoreAutoSwipeOnce = NO;
}
-(void)swipeView:(SwipeView *)swipeView didSelectItemAtIndex:(NSInteger)index{
    // NSLog(@"Selected index: %d", index);
    //    AppreciateViewController  * appreciateVc = [[AppreciateViewController alloc] init];
    //    [self.navigationController pushViewController:appreciateVc animated:YES];
}


#pragma mark-
-(void)loadScrollView
{
    for (int i=0; i<[arrImages count]; i++) {
        
        //
        UIImageView *tempImageView = [[UIImageView alloc] initWithFrame:CGRectMake(Curbounds.size.width*i,0 , Curbounds.size.width, Curbounds.size.height-5)];
        [tempImageView setImage:[UIImage imageNamed:[arrImages objectAtIndex:i]]];
        tempImageView.tag = 100+i;
        tempImageView.userInteractionEnabled = YES;
        [myscrollView addSubview:tempImageView];
    
        
    }
}

-(void)goNextPage{
    if (_ignoreAutoSwipeOnce) {
        //忽略本次自动切换
        _ignoreAutoSwipeOnce = NO;
        [self performSelector:@selector(goNextPage) withObject:nil afterDelay:5.0];
        return;
    }
    NSInteger nextPageIndex = (_swipeView.currentPage == _swipeView.numberOfPages-1)?0:_swipeView.currentPage+1;
    [_swipeView scrollToPage:nextPageIndex duration:0.3];
    
    [self performSelector:@selector(goNextPage) withObject:nil afterDelay:5.0];
}

@end
