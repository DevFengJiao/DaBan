//
//  MSAgreeViewController.h
//  DaBan
//
//  Created by qkm on 15-8-17.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MSBeseViewController.h"

@interface MSAgreeViewController : MSBeseViewController<UITableViewDataSource,UITableViewDelegate>

{
    UITableView *mainTableView;
}

@end
