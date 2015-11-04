//
//  RefreshEmptyDataView.m
//
//
//  Created by ZhangWeiXin on 15-5-20.
//  Copyright (c) 2012年 Seven. All rights reserved.
//

#import "RefreshLinkErrorView.h"

#define KDataErrorImage         @"refresh_image.png"
#define KLinkErrorText          @"网络出问题了"

@interface RefreshLinkErrorView ()
@end

@implementation RefreshLinkErrorView
@synthesize title = _title;
@synthesize titleImage = _titleImage;
@synthesize prompt = _prompt;
@synthesize btn = _btn;
@synthesize showBtn;

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

- (void)setShowBtn:(BOOL)_showBtn
{
    showBtn = _showBtn;
    _btn.hidden = !showBtn;
}

-(id)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        _titleImage = [[UIImageView alloc] init];
        _titleImage.image = [UIImage imageNamed:@"refresh_image.png"];
        
        _title = [[UILabel alloc] init];
        _title.adjustsFontSizeToFitWidth = YES;
        _title.font = [UIFont systemFontOfSize:18];
        _title.minimumScaleFactor = 15.0f; //设置字体缩放因素;
        _title.backgroundColor = [UIColor clearColor];
        _title.textAlignment = NSTextAlignmentCenter;
        _title.lineBreakMode = NSLineBreakByCharWrapping;
        _title.textColor = k_TEXTCOLOR_DARKGRAY;
        _title.numberOfLines = 3;
        [_title setText:KLinkErrorText];
        
        _prompt = [[UILabel alloc] init];
        _prompt.backgroundColor = [UIColor clearColor];
        _prompt.textAlignment = NSTextAlignmentCenter;
        _prompt.textColor = [UIColor darkGrayColor];
        _prompt.font = [UIFont systemFontOfSize:15];
        _prompt.lineBreakMode = NSLineBreakByCharWrapping;
        _prompt.numberOfLines = 3;
        
        _btn = [self createBaseBtn];
        [_btn setTitle:@"重新获取" forState:UIControlStateNormal];
        
        [self addSubview:_title];
        [self addSubview:_titleImage];
        [self addSubview:_prompt];
        [self addSubview:_btn];
    }
    return self;
}

- (UIButton *)createBaseBtn
{
    UIButton *btn = [[UIButton alloc] init];
    [self setBtnAsBaseBtn:btn];
    return btn;
}

-  (void)setBtnAsBaseBtn:(UIButton *)btn
{
    btn.exclusiveTouch = YES;
    
    UIImage* image = [[UIImage imageNamed:@"refresh_base_btn"] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
    UIImage* imageSelect = [[UIImage imageNamed:@"refresh_base_btn_h"] stretchableImageWithLeftCapWidth:5 topCapHeight:5];
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    [btn setBackgroundImage:imageSelect forState:UIControlStateHighlighted];
    [btn setBackgroundImage:imageSelect forState:UIControlStateDisabled];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
}




-(void)layoutSubviews
{
    CGFloat x,y,w,h;
    
    x=(self.bounds.size.width-_titleImage.image.size.width)/2;
    y=20;
    w=_titleImage.image.size.width;
    h=_titleImage.image.size.height;
    CGRect titleImageFrame = CGRectMake(x, y, w, h);
    [_titleImage setFrame: titleImageFrame];
    
    w=MIN([_title.text sizeWithFont:_title.font].width+10, self.bounds.size.width-20);
    x=(self.bounds.size.width-w)/2;
    y=titleImageFrame.origin.y+titleImageFrame.size.height+20;
    
    CGSize constraint = CGSizeMake(w,CGFLOAT_MAX);
    CGSize aRect = [_title.text sizeWithFont:_title.font constrainedToSize:constraint lineBreakMode:(NSLineBreakMode)NSLineBreakByCharWrapping];
    h=aRect.height;
    
    CGRect titleFrame = CGRectMake(x, y, w, h);
    [_title setFrame:titleFrame];
    
    w=self.bounds.size.width-20;
    h=50.0f;
    x=(self.bounds.size.width-w)/2;
    y=titleFrame.origin.y+titleFrame.size.height+5;
    CGRect promptFrame = CGRectMake(x, y, w, h);
    [_prompt setFrame:promptFrame];
    
    w=150.0f;
    h=42.0f;
    x=(self.bounds.size.width-w)/2;
    y=promptFrame.origin.y+promptFrame.size.height+5;
    CGRect btnFrame = CGRectMake(x, y, w, h);
    [_btn setFrame:btnFrame];
    _btn.hidden = !showBtn;
}

- (CGFloat) heightWithWidth:(CGFloat) width
{
    CGFloat x,y,w,h;
    
    x=(APPLICATION_WIDTH-_titleImage.image.size.width)/2;
    y=20;
    w=_titleImage.image.size.width;
    h=_titleImage.image.size.height;
    CGRect titleImageFrame = CGRectMake(x, y, w, h);
    
    w=APPLICATION_WIDTH/2;
    x=(APPLICATION_WIDTH-w)/2;
    y=titleImageFrame.origin.y+titleImageFrame.size.height+20;
    
    CGSize constraint = CGSizeMake(w,CGFLOAT_MAX);
    CGSize aRect = [_title.text sizeWithFont:[UIFont systemFontOfSize:20] constrainedToSize:constraint lineBreakMode:(NSLineBreakMode)NSLineBreakByCharWrapping];
    h=aRect.height;
    
    CGRect titleFrame = CGRectMake(x, y, w, h);

    
    w=APPLICATION_WIDTH;
    h=50.0f;
    x=(APPLICATION_WIDTH-w)/2;
    y=titleFrame.origin.y+titleFrame.size.height+5;
    CGRect promptFrame = CGRectMake(x, y, w, h);

    
    w=150.0f;
    h=42.0f;
    x=(APPLICATION_WIDTH-w)/2;
    y=promptFrame.origin.y+promptFrame.size.height+5;

    return y + h + 20;
}


+(id)refreshViewWithPromptMsg:(NSString *)promptMsg
{
    RefreshLinkErrorView *refreshView = [[RefreshLinkErrorView alloc] init];
    [refreshView.prompt setText:promptMsg];
    return refreshView;
}

+(id)refreshNoDataViewWithPromptMsg:(NSString*)promptMsg
{
    RefreshLinkErrorView *refreshView = [[RefreshLinkErrorView alloc] init];
    [refreshView.title setText:KNoDataErrorTitle];
    refreshView.titleImage.image = [UIImage imageNamed:@"refresh_nodata.png"];
    //[refreshView.btn setImage:Theme_imageNamed(@"refresh_add.png") forState:UIControlStateNormal];
    [refreshView.btn setImage:[UIImage imageNamed:(@"refresh_add.png")] forState:UIControlStateNormal];
    [refreshView.btn setTitle:@"添加商户" forState:UIControlStateNormal];
    refreshView.btn.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    
    [refreshView.prompt setText:promptMsg];
    return refreshView;
}

@end
