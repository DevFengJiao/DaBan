//
//  MSCarCell.h
//  DaBan
//
//  Created by qkm on 15-8-5.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSCarModel.h"

@interface MSCarCell : UITableViewCell
{
    UIButton    *addCarBtn;
    UILabel     *titleLab;
    UILabel     *arecLab;
   
}
@property (nonatomic ,strong) MSCarModel *model;


@end
