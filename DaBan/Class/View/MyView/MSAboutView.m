//
//  MSAboutView.m
//  DaBan
//
//  Created by qkm on 15-9-14.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSAboutView.h"

@implementation MSAboutView

-(id)init{
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}

-(void)initUI{
    UIImageView *bgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    bgV.backgroundColor = [UIColor clearColor];
    bgV.userInteractionEnabled = YES;
    bgV.image = [UIImage imageNamed:@"mainBgV.png"];
    [self addSubview:bgV];
    
    UIImageView *icon = [[UIImageView alloc]initWithFrame:CGRectMake(100, 50, SCREEN_WIDTH-100*2, SCREEN_WIDTH-100*2)];
    icon.backgroundColor = [UIColor clearColor];
    icon.userInteractionEnabled = YES;
    icon.image = [UIImage imageNamed:@"mainAbout"];
    [bgV addSubview:icon];
    
    self.myName = [[UILabel alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(icon.frame)+10, SCREEN_WIDTH, 20)];
    self.myName.backgroundColor = [UIColor clearColor];
    self.myName.textColor = ZIGRAY;
    self.myName.textAlignment = NSTextAlignmentCenter;
    self.myName.font = [UIFont systemFontOfSize:18];
    self.myName.text = @"搭伴";
    [bgV addSubview:self.myName];
    
    UILabel *editionLab = [[UILabel alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.myName.frame)+10, SCREEN_WIDTH, 20)];
    editionLab.backgroundColor = [UIColor clearColor];
    editionLab.textColor = ZIGRAY;
    editionLab.textAlignment = NSTextAlignmentCenter;
    editionLab.font = [UIFont systemFontOfSize:10];
    editionLab.text = [NSString stringWithFormat:@"v%@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
    [bgV addSubview:editionLab];
    
    NSArray *titles = @[@"电话 0755-26037731",@"客服 400-000-9919"];
    
    for (int i= 0; i<2; i++) {
        self.telBtn = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2 - 100, CGRectGetMaxY(editionLab.frame)+65+i*60, 200, 40)];
        self.telBtn.tag = i;
        self.telBtn.backgroundColor = [UIColor clearColor];
        self.telBtn.layer.cornerRadius = 8;
        self.telBtn.layer.borderColor = APP_COLOR.CGColor;
        self.telBtn.layer.borderWidth = 1;
        self.telBtn.titleLabel.font = ZIFOUT14;
        [self.telBtn setTitle:titles[i] forState:UIControlStateNormal];
        [self.telBtn setTitleColor:APP_COLOR forState:UIControlStateNormal];
        [self.telBtn addTarget:self action:@selector(telClick:) forControlEvents:UIControlEventTouchUpInside];
        [bgV addSubview:self.telBtn];
    }
    
    UILabel *ziLabe = [[UILabel  alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-64-20-12, SCREEN_WIDTH, 12)];
    ziLabe.backgroundColor = [UIColor clearColor];
    ziLabe.text = @"深圳市青稞麦科技有限公司";
    ziLabe.font = ZIFOUT12;
    ziLabe.textAlignment = NSTextAlignmentCenter;
    ziLabe.textColor = LINE9;
    [bgV addSubview:ziLabe];
    
}

-(void)telClick:(UIButton *)sender{
    if (self.delegate &&[self.delegate respondsToSelector:@selector(msAboutViewDelegate:)]) {
        return [self.delegate msAboutViewDelegate:sender.tag];
    }
}

@end
