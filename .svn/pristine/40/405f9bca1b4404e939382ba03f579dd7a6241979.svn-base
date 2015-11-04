//
//  RefreshEmptyDataView.h
//  LifeSearch
//
//  Created by liurui on 12-6-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshBaseView.h"

@interface RefreshLinkErrorView : RefreshBaseView
{
    UIImageView *_titleImage;
    UILabel     *_title;
    UILabel     *_prompt;
    UIButton    *_btn;
}

@property (nonatomic , retain)UILabel *title;
@property (nonatomic , retain)UILabel *prompt;
@property (nonatomic , retain)UIImageView *titleImage;
@property (nonatomic , retain)UIButton *btn;
@property (nonatomic)BOOL showBtn;

+(id)refreshViewWithPromptMsg:(NSString*)promptMsg;

+(id)refreshNoDataViewWithPromptMsg:(NSString*)promptMsg;

- (CGFloat) heightWithWidth:(CGFloat) width;

@end
