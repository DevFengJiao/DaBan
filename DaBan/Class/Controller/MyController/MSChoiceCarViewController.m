//
//  MSChoiceCarViewController.m
//  DaBan
//
//  Created by qkm on 15-8-11.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSChoiceCarViewController.h"
#import "WSDropMenuView.h"
#import "MSSearch.h"

@interface MSChoiceCarViewController ()<WSDropMenuViewDataSource,WSDropMenuViewDelegate>
@property (nonatomic, strong)  UIBarButtonItem *editButton;
@property (nonatomic, strong)  MSSearch *search;

@property (nonatomic, copy) NSString *seletedType;
@property (nonatomic, copy) NSString *seletedSubtype;


@property (nonatomic, retain) NSArray *typs;
@property (nonatomic, retain) NSArray *subtyps;

@end

@implementation MSChoiceCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"选择车型";
    self.typs = [MSCarModel types];
    
    
    [self setNavigationBarRightbutton];
    [self drawTopView];

    _search = [[MSSearch alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    MSCarModel *model = [[MSCarModel alloc]init];
    model.searchName = @"搜索您的爱车";
    _search.model = model;
    [self.view addSubview:_search];
    
    WSDropMenuView *dropMenu = [[WSDropMenuView alloc] initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 40)];
    dropMenu.dataSource = self;
    dropMenu.delegate  =self;
    dropMenu.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:dropMenu];
}

-(void)drawTopView{
    
    
}

-(void)setNavigationBarRightbutton{
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(5, 0, 20, 15);
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"sure.png"] forState:UIControlStateNormal];
    
    [rightBtn setTintColor:[UIColor whiteColor]];
    [rightBtn addTarget:self action:@selector(rightBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.editButton = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
    self.navigationItem.rightBarButtonItem = self.editButton;
}

-(void)rightBtnAction: (UIButton *)sender{
    //显示多选圆圈
    
    
}

#pragma mark - WSDropMenuView DataSource -
-(NSInteger)dropMenuView:(WSDropMenuView *)dropMenuView selectWithIndexPath:(WSIndexPath *)indexPath{
    if (indexPath.column == 0) {
        return self.typs.count;
    }
    
    return 0;
}

- (NSInteger)dropMenuView:(WSDropMenuView *)dropMenuView numberWithIndexPath:(WSIndexPath *)indexPath{
    
    //WSIndexPath 类里面有注释
    
    if (indexPath.column == 0 && indexPath.row == WSNoFound) {
        NSLog(@"selec:%d",indexPath.selec);
        return [[self.typs objectAtIndex:indexPath.selec-1] count];
    }
    if (indexPath.column == 0 && indexPath.row != WSNoFound && indexPath.item == WSNoFound) {
      
        return self.subtyps.count;
    }

    return 0;
}

- (NSString *)dropMenuView:(WSDropMenuView *)dropMenuView titleWithIndexPath:(WSIndexPath *)indexPath{
    //左边 第一级&& indexPath.row != WSNoFound && indexPath.item == WSNoFound
    if (indexPath.column == 0 ) {
//        NSInteger i = [[self.typs objectAtIndex:indexPath.row]count];
        
        self.seletedType = [[self.typs objectAtIndex:indexPath.selec]objectAtIndex:indexPath.row] ;
        NSLog(@"---%@--%ld--%ld",self.seletedType,indexPath.selec,indexPath.row);
//        self.subtyps = [MSCarModel subtypesOfType:self.seletedType];
//        
//        NSLog(@"---%@",self.subtyps);
        return [NSString stringWithFormat:@"%@",self.seletedType];
    }
    
    if (indexPath.column == 0 && indexPath.row != WSNoFound && indexPath.item != WSNoFound && indexPath.rank == WSNoFound) {
        
//
//        
//        self.seletedType = [NSString stringWithFormat:@"   %c", indexPath.row + 'A'];
//        self.subtyps = @[[MSCarModel subtypesOfType:self.seletedType]];
//        NSLog(@"--%@",self.subtyps);
        
        return [NSString stringWithFormat:@"1"];
        //return self.subtyps[indexPath.item];
    }
    
    return @"";
    
}


#pragma mark - WSDropMenuView Delegate -

- (void)dropMenuView:(WSDropMenuView *)dropMenuView didSelectWithIndexPath:(WSIndexPath *)indexPath{
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
