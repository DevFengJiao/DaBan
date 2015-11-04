//
//  MSHelpViewController.m
//  DaBan
//
//  Created by qkm on 15-8-17.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSHelpViewController.h"

@interface MSHelpViewController ()

@end

@implementation MSHelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"帮助";
    mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    mainTableView.delegate = self;
    mainTableView.dataSource = self;
    mainTableView.scrollEnabled = NO;
    mainTableView.showsVerticalScrollIndicator = NO;
    mainTableView.backgroundColor = [UIColor clearColor];
    mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:mainTableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CELLHEIGHT;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentf =@"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentf];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentf];
    }
    for (id subView in cell.contentView.subviews) {
        
        if ([subView isKindOfClass:[UIView class]]) {
            
            UIView *vie = (UIView *)subView;
            [vie removeFromSuperview];
        }
    }

    cell.selectionStyle = UITableViewCellStyleDefault;
    
    NSArray *titles = @[@"乘客帮助",@"车主帮助"];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 140, CELLHEIGHT)];
    titleLabel.text = titles[indexPath.row];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textColor = ZICOLOR;
    titleLabel.font = [UIFont systemFontOfSize:16];
    [cell.contentView addSubview:titleLabel];
    
    if (indexPath.row ==0 ) {
        UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, CELLHEIGHT-0.5, SCREEN_WIDTH, 0.5)];
        line.backgroundColor = LINEC;
        [cell.contentView addSubview:line];
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
