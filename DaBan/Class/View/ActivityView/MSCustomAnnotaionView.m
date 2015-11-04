//
//  MSCustomAnnotaionView.m
//  DaBan
//
//  Created by qkm on 15-9-16.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSCustomAnnotaionView.h"
#define kCalloutWidth       200.0
#define kCalloutHeight      70.0
@interface MSCustomAnnotaionView ()

@property (nonatomic, strong, readwrite) MSCustomAnnotaionView *calloutView;

@end

@implementation MSCustomAnnotaionView
-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
    if (self.selected == selected) {
        return;
    }
    if (selected) {
        if (self.calloutView == nil) {
            self.calloutView = [[MSCustomAnnotaionView alloc] initWithFrame:CGRectMake(0, 0, kCalloutWidth, kCalloutHeight)];
            self.calloutView.center = CGPointMake(CGRectGetWidth(self.bounds) / 2.f + self.calloutOffset.x,
                                                  -CGRectGetHeight(self.calloutView.bounds) / 2.f + self.calloutOffset.y);
        }
//        self.calloutView.image = [UIImage imageNamed:@"activity_location_carHeadImg"];
        self.calloutView.title = self.annotation.title;
        self.calloutView.subtitle = self.annotation.subtitle;
        
        [self addSubview:self.calloutView];
    }else{
        [self.calloutView removeFromSuperview];
    }
    
    [super setSelected:selected animated:animated];
}


@end
