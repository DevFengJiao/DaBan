//
//  MSAboutView.h
//  DaBan
//
//  Created by qkm on 15-9-14.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSBaseView.h"

@protocol MSAboutViewDelegate <NSObject>

-(void)msAboutViewDelegate:(NSInteger)tag;

@end

@interface MSAboutView : MSBaseView
@property (nonatomic, strong) UILabel *myName;
@property (nonatomic, strong) UIButton  *telBtn;
@property (nonatomic, weak)   id<MSAboutViewDelegate> delegate;
@end
