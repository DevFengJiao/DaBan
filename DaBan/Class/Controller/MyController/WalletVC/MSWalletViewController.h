//
//  MSWalletViewController.h
//  DaBan
//
//  Created by qkm on 15-8-19.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSBeseViewController.h"

@interface MSWalletViewController : MSBeseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *mainTabelView;
}


@end
