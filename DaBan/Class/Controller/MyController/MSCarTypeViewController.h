//
//  MSCarTypeViewController.h
//  Moses
//
//  Created by soresult on 13-9-6.
//  Copyright (c) 2013年 soresult. All rights reserved.
//

#import "MSBeseViewController.h"

#import "MSCar.h"

@protocol MSCarStringDelegate <NSObject>

-(void)MSCarString:(NSString *)type andCarSubType:(NSString*)sub;

@end

@interface MSCarTypeViewController :MSBeseViewController

@property (nonatomic, retain) MSCar *car;
@property (nonatomic, assign) id<MSCarStringDelegate>delegate;
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) IBOutlet UITableView *subTypeTableView;

@end
