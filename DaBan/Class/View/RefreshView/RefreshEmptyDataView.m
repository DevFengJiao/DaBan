//
//  RefreshEmptyDataView.m
//

//  Created by ZhangWeiXin on 15-5-20.
//  Copyright (c) 2012年 Seven. All rights reserved.
//

#import "RefreshEmptyDataView.h"

@implementation RefreshEmptyDataView
@synthesize errText = _errText;
@synthesize onTop;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(id)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        _errText = [[UILabel alloc] init];
        _errText.numberOfLines = 5;
        _errText.textColor = k_TEXTCOLOR_DARKGRAY;
        _errText.lineBreakMode = NSLineBreakByCharWrapping;
        _errText.backgroundColor = [UIColor clearColor];
        _errText.textAlignment = NSTextAlignmentCenter;
        _errText.font = [UIFont systemFontOfSize:16];

        [_errText setText:KNoDataErrorTitle];
        [self addSubview:_errText];
        
        CGFloat x,y,w,h;
        w=self.bounds.size.width/2+120;
        h=280.0f;
        x=(self.bounds.size.width-w)/2;
        y=0.0f;
        CGRect errtextFrame = CGRectMake(x, y, w, h);
        [self.errText setFrame:errtextFrame];
    }
    
    return self;
}

-(void)layoutSubviews
{
    if (onTop) {
        CGRect errtextFrame = CGRectMake(0, 50, self.bounds.size.width, self.bounds.size.height - 50);
        [self.errText setFrame:errtextFrame];
    }
    else
    {
        CGFloat x,y,w,h;
        w=self.bounds.size.width/2+120;
        h=280.0f;
        x=(self.bounds.size.width-w)/2;
        y=0.0f;
        CGRect errtextFrame = CGRectMake(x, y, w, h);
        [self.errText setFrame:errtextFrame];
    }
}

+(id)refreshViewWithErrorText:(NSString *)text
{
    RefreshEmptyDataView *emptyView = [[RefreshEmptyDataView alloc] init];
    [emptyView.errText setText:text];
    return emptyView;
}

@end
