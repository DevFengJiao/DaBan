//
//  MSAddLineViewController.m
//  DaBan
//
//  Created by qkm on 15-8-28.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSAddLineViewController.h"
#import "MSWindosView.h"
#import "MSAddMapViewController.h"


@interface MSAddLineViewController ()<MSWindowsDelegate,AddMapViewControllerDelegate>
{
    UILabel *titlelab1;
}
@property (nonatomic, strong) MSWindosView *windowView;
@end

@implementation MSAddLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发布线路";
    
    titles = @[@"座位数",@"期待乘客",@"平推费"];
    images = @[@"activity_add01",@"activity_add02",@"activity_add03"];
    mainArrays = [NSMutableArray array];
    
    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"peopleBool2"])
    {
        self.people = 3;
    }
    else
    {
        self.people = [[NSUserDefaults standardUserDefaults]integerForKey:@"people2"];
    }

    mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-100) style:UITableViewStyleGrouped];
    mainTableView.backgroundColor = [UIColor clearColor];
    mainTableView.delegate = self;
    mainTableView.dataSource = self;
    mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:mainTableView];
    
    [self setBelowButtonTitle:@"发布"];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section ==0) {
        return 1;
    }else{
        return titles.count;
    }
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 8;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0.00001;
    }else{
        return 2;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CELLHEIGHT;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentf = @"cell";
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
    cell.backgroundColor = [UIColor whiteColor];

    if (indexPath.section == 0) {
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(12.5, 17.5,15, 20)];
        iv.backgroundColor = [UIColor clearColor];
        iv.image = [UIImage imageNamed:@"activity_location"];
        
        [cell.contentView addSubview:iv];
        
        titlelab1 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(iv.frame)+5+5, 0, SCREEN_WIDTH/2+50,CELLHEIGHT)];
        titlelab1.backgroundColor = [UIColor clearColor];
        titlelab1.textColor = ZIGRAY;
        titlelab1.font = [UIFont fontWithName:Helvetica size:16];
        titlelab1.text = @"我的位置";
        [cell.contentView addSubview:titlelab1];
    }else{
    
        UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(10, 17.5,20, 20)];
        iv.backgroundColor = [UIColor clearColor];
        iv.image = [UIImage imageNamed:images[indexPath.row]];
        
        [cell.contentView addSubview:iv];
        
        UILabel *titlelab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(iv.frame)+5, 0, SCREEN_WIDTH/2+50, CELLHEIGHT)];
        titlelab.backgroundColor = [UIColor clearColor];
        titlelab.textColor = ZIGRAY;
        titlelab.font = [UIFont fontWithName:Helvetica size:16];
        titlelab.text = titles[indexPath.row];
        [cell.contentView addSubview:titlelab];
        
        if (indexPath.row == 0) {
            UIButton *datRBut = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH -90, 10,35, CELLHEIGHT-20)];
            datRBut.backgroundColor = [UIColor clearColor];
            [datRBut setTitle:@"-" forState:UIControlStateNormal];
            [datRBut setTitleColor:ZIGRAY forState:UIControlStateNormal];
//            [datRBut setBackgroundImage:[UIImage imageNamed:@"z.png"] forState:UIControlStateNormal];
            datRBut.tag = 100;
            [datRBut addTarget:self action:@selector(datRButAction:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView  addSubview:datRBut];
            
            //天数的textField
            peopleLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(datRBut.frame), 10,20, CELLHEIGHT-20)];
       
            peopleLab.text = [NSString stringWithFormat:@"%ld",self.people];
            peopleLab.textColor = ZIGRAY;
            peopleLab.font = [UIFont systemFontOfSize:15];
            peopleLab.backgroundColor = [UIColor clearColor];
            peopleLab.textAlignment = NSTextAlignmentCenter;
            [cell.contentView addSubview:peopleLab];
            
            
            UIButton *dayLBut = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(peopleLab.frame), 10,35, CELLHEIGHT-20)];
            dayLBut.backgroundColor = [UIColor clearColor];
            [dayLBut setTitle:@"+" forState:UIControlStateNormal];
            [dayLBut setTitleColor:ZIGRAY forState:UIControlStateNormal];
//            [dayLBut setBackgroundImage:[UIImage imageNamed:@"y.png"] forState:UIControlStateNormal];
            dayLBut.tag = 101;
            [dayLBut addTarget:self action:@selector(datRButAction:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:dayLBut];
            
        }else if (indexPath.row == 1){
            
            sexLab = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-60, 0, 50, CELLHEIGHT)];
            sexLab.backgroundColor = [UIColor clearColor];
            sexLab.textAlignment = NSTextAlignmentRight;
            if (![[NSUserDefaults standardUserDefaults] boolForKey:@"sexBool"]) {
                sexLab.text = @"女";
            }else{
                sexLab.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"sex"];
            }
            sexLab.textColor = ZIGRAY;
            sexLab.font = [UIFont systemFontOfSize:14];
            [cell.contentView addSubview:sexLab];
            
        }else{
            
            UILabel *priceLab = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-120, 0, 110, CELLHEIGHT)];
            priceLab.backgroundColor = [UIColor clearColor];
            priceLab.textAlignment = NSTextAlignmentRight;
            priceLab.text = @"300-600元";
            priceLab.textColor = [UIColor colorFromHexString:@"0xf56b58"];
            priceLab.font = [UIFont systemFontOfSize:14];
            [cell.contentView addSubview:priceLab];
            
        }
        
        if (indexPath.row != titles.count-1) {
            UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, CELLHEIGHT-0.5, SCREEN_WIDTH, 0.5)];
            line.backgroundColor = LINEC;
            [cell.contentView addSubview:line];
        }

    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        MSAddMapViewController *map  = [[MSAddMapViewController alloc]init];
        map.delegate = self;
        [self.navigationController pushViewController:map animated:YES];
    }else{
        if (indexPath.row == 0) {
            
        }else if(indexPath.row == 1){
            self.windowView = [[MSWindosView  alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];

            self.windowView.type = 1;
         
            self.windowView.delegate = self;
            [self.view addSubview:self.windowView];
            
            MSComModel *model = [[MSComModel alloc]init];
            model.arecs = @[@"男",@"女",@"随机"];
            model.title = @"性别选择";
            self.windowView.model = model;
            self.windowView.backView2.frame = CGRectMake(self.windowView.backView2.frame.origin.x   , 100, self.windowView.backView2.frame.size.width,self.windowView.backView2.frame.size.height);
        }else{
        
        }
    }
    
}



//行程天数加减按钮的点击事件
- (void)datRButAction:(UIButton *)sender{
    
    //tag 100 是加 101 是减
    if (sender.tag == 101) {
        if (self.people == 3) {
            self.people = self.people;
            [self showMyMessage:@"亲，最多是3人"];
        }else{
            self.people++;
        }

    }else{
                
        if (self.people == 1) {
            self.people = self.people;
        }else{
            self.people--;
        }
                
    }

    peopleLab.text = [NSString  stringWithFormat:@"%ld",self.people];
    
    [[NSUserDefaults standardUserDefaults]setInteger:self.people forKey:@"people2"];
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"peopleBool2"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)msWindowsViewSendMSWindows:(NSInteger)tag{
    
    MSComModel *model = [[MSComModel alloc]init];
    //要保存的数据
    sexLab.text = model.arecs[tag];
    [[NSUserDefaults standardUserDefaults]setObject:model.arecs[tag] forKey:@"sex"];
    [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"sexBool"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.windowView removeFromSuperview];
}

-(void)belowBtnClick{
    
}

-(void)addMapViewControllerDelegate:(NSString *)title andTag:(int)tag andlatitude:(CGFloat)latitude andLongitude:(CGFloat)longitude{
    titlelab1.text = title;
    NSLog(@"---%f--%f",latitude,longitude);
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
