//
//  MSWindosView.m
//  DaBan
//
//  Created by qkm on 15-8-14.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSWindosView.h"

@implementation MSWindosView

-(id)init
{
    self = [super init];
    if (self) {
//        [self initUI];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        [self initUI];
    }
    return self;
    
}

-(void)initUI{

    
    self.backView= [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49)];
    self.backView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [self addSubview:self.backView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapRemoveBackView:)];
    [self.backView addGestureRecognizer:tap];
    
    self.backView2 = [[UIView   alloc]initWithFrame:CGRectMake(20, 438/2-62, SCREEN_WIDTH-40, 43*3+1)];
    self.backView2.backgroundColor = [UIColor whiteColor];
    self.backView2.layer.cornerRadius  = 3;
    [self.backView addSubview:self.backView2];
    
    self.titleView = [[UIView alloc]init];
    //1 是司机 2是乘客
    if (self.type == 1) {
         self.titleView.frame = CGRectMake(0, 0, 0, 0);
    }else{
         self.titleView.frame = CGRectMake(0, 0, self.backView2.frame.size.width, 50);
    }
    self.titleView.backgroundColor = [UIColor clearColor];
    [self.backView2 addSubview:self.titleView];
    

    UILabel *peoplelab = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, self.backView2.frame.size.width, 43)];
    peoplelab.backgroundColor = [UIColor clearColor];
    peoplelab.text = @"搭伴人数";
    if (self.type == 1) {
        peoplelab.frame = CGRectMake(0, 0, 0, 0);
    }
    peoplelab.textColor = APP_COLOR;
    peoplelab.font = [UIFont systemFontOfSize:16.0];
    peoplelab.textAlignment = NSTextAlignmentCenter;
    [self.titleView addSubview:peoplelab];
    
    UILabel *peoplelinelab = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(peoplelab.frame), self.titleView.frame.size.width-20, 0.5)];

    peoplelinelab.backgroundColor = LINEE;
    [self.titleView addSubview:peoplelinelab];
    
    self.peoplelab2 = [[UILabel alloc]initWithFrame:CGRectMake(self.titleView.frame.size.width/2-8, CGRectGetMaxY(peoplelinelab.frame), 16, 43)];
    self.peoplelab2.backgroundColor = [UIColor clearColor];
    self.peoplelab2.textAlignment = NSTextAlignmentCenter;
    self.peoplelab2.font = [UIFont systemFontOfSize:16.0];
    self.peoplelab2.text = [NSString stringWithFormat:@"%ld",self.model.people];
    [self.titleView addSubview:self.peoplelab2];
    
    
    self.peopleBtn = [[UIButton alloc]initWithFrame:CGRectMake(self.titleView.frame.size.width/2-60,CGRectGetMaxY(peoplelinelab.frame)+6.5,50, 30)];
    if (self.type == 1) {
        self.peopleBtn.frame = CGRectMake(0, 0, 0, 0);
    }
    self.peopleBtn.backgroundColor = [UIColor clearColor];
    [self.peopleBtn setTitleColor:[UIColor colorFromHexString:@"0x000000"] forState:UIControlStateNormal];
    [self.peopleBtn setTitle:@"-" forState:UIControlStateNormal];
    [self.peopleBtn addTarget:self action:@selector(peopleBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.peopleBtn.tag = 100;

    [self.titleView addSubview:self.peopleBtn];
    
 
    
    self.peopleBtn2 = [[UIButton alloc]initWithFrame:CGRectMake(self.titleView.frame.size.width/2+10,CGRectGetMaxY(peoplelinelab.frame)+6.5,50, 30)];
    
    self.peopleBtn2.backgroundColor = [UIColor clearColor];
    [self.peopleBtn2 setTitleColor:[UIColor colorFromHexString:@"0x000000"] forState:UIControlStateNormal];
    [self.peopleBtn2 setTitle:@"+" forState:UIControlStateNormal];
    [self.peopleBtn2 addTarget:self action:@selector(peopleBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.peopleBtn2.tag = 101;
    [self.titleView addSubview:self.peopleBtn2];
    
       UILabel *peoplelinelab2 = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.peopleBtn.frame)+6.5, self.titleView.frame.size.width-20, 0.5)];
    
    peoplelinelab2.backgroundColor = LINE9;
    
    if (self.type == 1) {
        self.peopleBtn2.hidden = YES;
        self.peoplelab2.hidden = YES;
        peoplelinelab.hidden  = YES;
        peoplelinelab2.hidden = YES;
    }

    [self.titleView addSubview:peoplelinelab2];
    
    
    
    self.titleView.frame = CGRectMake(self.titleView.frame.origin.x, self.titleView.frame.origin.y, self.titleView.frame.size.width, CGRectGetMaxY(peoplelinelab2.frame));
    
    
    
    self.title = [[UILabel alloc]initWithFrame:CGRectMake(0, 5+CGRectGetMaxY(self.titleView.frame), self.backView2.frame.size.width, 43)];
    self.title.backgroundColor = [UIColor clearColor];
    self.title.textColor = APP_COLOR;
    self.title.font = [UIFont systemFontOfSize:18];
    self.title.textAlignment = NSTextAlignmentCenter;
     self.title.text = self.model.title;
    [self.backView2 addSubview:self.title];
    
    UIImageView *line = [[UIImageView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.title.frame), self.backView2.frame.size.width-20, 0.5)];
    if (self.type ==1) {
        line.backgroundColor = [UIColor colorFromHexString:@"0x999999"];
    }else{
        line.backgroundColor = [UIColor colorFromHexString:@"0xe2e2e2"];
    }
    
    
    [self.backView2 addSubview:line];
    
    for (int i = 0; i<self.arecArrays.count; i++) {
        self.imageButton = [[UIButton alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(line.frame)+i*43.5, self.backView2 .frame.size.width-20, 43)];
        
        self.imageButton.backgroundColor = [UIColor clearColor];
        [self.imageButton setTitleColor:ZIGRAY forState:UIControlStateNormal];
        [self.imageButton setTitle:self.arecArrays[i] forState:UIControlStateNormal];
        [self.imageButton addTarget:self action:@selector(imageButton:) forControlEvents:UIControlEventTouchUpInside];
        self.imageButton.tag = i;
        self.imageButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self.backView2 addSubview:self.imageButton];
        
        if (self.isPay == YES) {
            if (i == self.arecArrays.count-1) {
                [self.imageButton setTitleColor:LINE9 forState:UIControlStateNormal];
                self.imageButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
            }
        }
        
        if ( i != self.arecArrays.count-1) {
            UIImageView *line2 = [[UIImageView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.imageButton.frame)+0.5, self.backView2.frame.size.width-20, 0.5)];
            line2.backgroundColor = [UIColor colorFromHexString:@"0xe2e2e2"];
            [self.backView2 addSubview:line2];
        }
       
        
    }

    self.backView2.frame = CGRectMake(self.backView2.frame.origin.x, self.backView2.frame.origin.y, self.backView2.frame.size.width, CGRectGetMaxY(self.imageButton.frame)+1);
    
    
}

-(void)tapRemoveBackView:(UITapGestureRecognizer *)recognizer{
    [self.backView2 removeFromSuperview];
    [self.backView removeFromSuperview];
    [self removeFromSuperview];
}

-(void)imageButton: (UIButton *)sender{

    if (self.delegate&&[self.delegate respondsToSelector:@selector(msWindowsViewSendMSWindows:)]) {
        [self.delegate msWindowsViewSendMSWindows:sender.tag];
    }
}

-(void)peopleBtn: (UIButton *)sender{
    if (self.delegate&&[self.delegate respondsToSelector:@selector(addPeopleWindowsView:)]) {
        [self.delegate addPeopleWindowsView:sender.tag];
    }
}


-(void)setModel:(MSComModel *)model{
    _model = model;
    
    self.arecArrays = model.arecs;
    
    [self initUI];
}

@end
