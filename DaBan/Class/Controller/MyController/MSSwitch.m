//
//  MSSwitch.m
//  Moses
//
//  Created by soresult on 13-8-28.
//  Copyright (c) 2013年 soresult. All rights reserved.
//

#import "MSSwitch.h"

@implementation MSSwitch

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //self.onImage = [UIImage imageNamed:@"switch_on.png"];
        //self.offImage = [UIImage imageNamed:@"switch_off.png"];
        self.thumbTintColor = [UIColor whiteColor];
  
        self.onTintColor = [UIColor colorWithRed:0/255.0 green:183/255.0 blue:144/255.0 alpha:1.0];
        self.tintColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    self.thumbTintColor = [UIColor whiteColor];
    self.onTintColor = [UIColor colorWithRed:0/255.0 green:183/255.0 blue:144/255.0 alpha:1.0];
    self.tintColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0];
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
