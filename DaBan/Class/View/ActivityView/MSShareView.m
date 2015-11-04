//
//  MSShareView.m
//  DaBan
//
//  Created by qkm on 15-9-15.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSShareView.h"

@implementation MSShareView

-(id)init
{
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
    
}
-(void)initUI{
    
    self.backView= [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    self.backView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
    [self addSubview:self.backView];
    
    self.backView2 = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-117-52-64, SCREEN_WIDTH,117+52)];
    self.backView2.backgroundColor = [UIColor whiteColor];
    [self.backView addSubview:self.backView2];
    
    NSArray *titles = @[@"微信",@"朋友圈",@"微博",@"QQ"];
    NSArray *myimages = @[@"share_wx",@"share_py",@"share_wb",@"share_qq"];
    for (int i=0; i<4; i++) {
        self.shareBtn = [[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-53*4-14*3)/2+i*67, 20, 53, 53)];
        self.shareBtn.backgroundColor = [UIColor clearColor];
        self.shareBtn.tag = i;
        [self.shareBtn setBackgroundImage:[UIImage imageNamed:myimages[i]] forState:UIControlStateNormal];
        [self.shareBtn addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.backView2 addSubview:self.shareBtn];
        
        self.titleLab = [[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-53*4-14*3)/2+i*67, CGRectGetMaxY(self.shareBtn.frame)+10, 53, 12)];
        self.titleLab.backgroundColor = [UIColor clearColor];
        self.titleLab.font = ZIFOUT12;
        self.titleLab.textAlignment = NSTextAlignmentCenter;
        self.titleLab.textColor = ZICOLOR;
        self.titleLab.text = titles[i];
        [self.backView2 addSubview:self.titleLab];
    }
    
    self.cancelBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, self.backView2.frame.size.height-52, SCREEN_WIDTH, 52)];
    self.cancelBtn.backgroundColor  = APP_COLOR;
    [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.cancelBtn.titleLabel.font = [UIFont systemFontOfSize:22];
    [self.backView2 addSubview:self.cancelBtn];
    
}

-(void)shareClick:(UIButton *)sender{

    if (self.delegate &&[self.delegate respondsToSelector:@selector(msShareViewDelegate:)]) {
        return [self.delegate msShareViewDelegate:sender.tag];
    }
    
}
@end
