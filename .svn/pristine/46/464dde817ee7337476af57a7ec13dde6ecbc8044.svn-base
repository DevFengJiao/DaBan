//
//  RefreshBaseView.m
//
//  Created by ZhangWeiXin on 15-5-20.
//  Copyright (c) 2012年 Seven. All rights reserved.
//

#import "RefreshBaseView.h"

@implementation RefreshBaseView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)showWithSuperView:(UIView *)superView size:(CGSize)boundSize
{
    CGRect frame = CGRectMake((superView.bounds.size.width-boundSize.width)/2, (superView.bounds.size.height-boundSize.height)/2, boundSize.width, boundSize.height);
    [self setFrame:frame];
    [superView addSubview:self];

//    for(UIView *view in superView.subviews)
//    {
//        if(view != self)
//            [view setHidden:YES];            
//    }
    [superView bringSubviewToFront:self];
}

-(void)hide
{
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
