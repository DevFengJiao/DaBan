//
//  MSUserViewController.m
//  DaBan
//
//  Created by qkm on 15-8-3.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSUserViewController.h"
#import "SVProgressHUD.h"
#import "MSUserModel.h"
#import "ASIFormDataRequest.h"
#import "MSChoiceCarViewController.h"
#import "MSCarTypeViewController.h"
#import "MSWindosView.h"

#define NUMBERS @"0123456789QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm\n"


@interface MSUserViewController ()<UIGestureRecognizerDelegate,UIPickerViewDelegate,UIPickerViewDataSource,MSCarStringDelegate,MSWindowsDelegate>
{
    UIButton           *_imageBtn;
    NSString           *_carName;
    NSString           *_carName2;
    UIButton           *carBnt;
    UILabel            *arecLab;
    UILabel            *carModelLab;
    UITextField        *carTxetField;
    
    UIView             *_colorView;
    UIView             *_colorView2;
    NSArray            *colors;
    
    UIView             *belowV;
    UIView             *belowV2;
    UIPickerView       *_pickView;
    
    NSArray            *_cityArrays;
    NSArray            *_letterArrays;
    NSArray            *_titles;
    NSArray            *_arecs;
    
    MSHeadView *headView;
}
@property (nonatomic) BOOL    isCar;
@property (nonatomic, strong) MSUserModel  *model;
@property (nonatomic, strong) MSWindosView  *windowView;
@end

@implementation MSUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self request];
    self.title = @"我的资料";
    self.navigationController.navigationBarHidden = NO;
    [self initCarData];
     [self setNavigationBarRightbutton];
}

- (void)setNavigationBarRightbutton{
   
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(25, 0, 80, 25);

    rightBtn.backgroundColor = [UIColor clearColor];
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:18.0];
    [rightBtn setTintColor:[UIColor whiteColor]];
    [rightBtn addTarget:self action:@selector(rightBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
//    UIImageView *iconIV = [[UIImageView alloc]initWithFrame:CGRectMake(65, 1.5, 22, 22)];
//    iconIV.backgroundColor = [UIColor clearColor];
//    iconIV.image = [UIImage imageNamed:@"01-1菜单icon.png"];
//    //resizableImageWithCapInsets:UIEdgeInsetsMake(10, 0, -10, 0)];
//    [rightBtn addSubview:iconIV];
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(50, 0, 40, 25)];
    lable.backgroundColor = [UIColor clearColor];
    lable.text = @"提交";
    lable.font = [UIFont systemFontOfSize:18.0];
    lable.textColor = ZI_NACOLOR;
    [rightBtn addSubview:lable];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
}

-(void)MSCarString:(NSString *)type andCarSubType:(NSString *)sub{
    carModelLab.text = [NSString stringWithFormat:@"%@%@",type,sub];
    NSLog(@"%@--%@",type,sub);
}

-(void)initCarData{
    _cityArrays = @[@"京",@"津",@"沪",@"渝",@"冀",@"晋",@"辽",@"吉",@"黑",@"苏",@"浙",@"皖",@"闽",@"赣",@"鲁",@"豫",@"鄂",@"湘",@"粤",@"琼",@"川",@"贵",@"云",@"陕",@"甘",@"青",@"藏",@"桂",@"宁",@"蒙",@"乌"];
    _arecs = @[@"请输入",@"请选择车型",@"请选择颜色"];
    _letterArrays = @[@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z"];
    
}

-(void)rightBtnAction: (UIButton *)sender{
    //显示多选圆圈
    [self requsetSetUser];
}

-(void)drawTableView{
    
    headView = [[MSHeadView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
    headView.backgroundColor = [UIColor whiteColor];
    headView.model = self.model;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(photo:)];
    tap.numberOfTouchesRequired = 1;
    tap.delegate = self;
    [headView addGestureRecognizer:tap];
    [self.view addSubview:headView];
    
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 130, SCREEN_WIDTH, SCREEN_HEIGHT)style:UITableViewStyleGrouped];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.backgroundColor = [UIColor clearColor];
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.scrollEnabled = NO;
        [self.view addSubview:_mainTableView];
    }
    
}

#pragma -mark
#pragma -mark drawCarView

-(void)drawBelowView{
    
    belowV = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    belowV.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [self.view addSubview:belowV];
    
    NSLog(@"%.f----%.f",self.view.bounds.size.height,SCREEN_HEIGHT);
    
    if (IOS7) {
        belowV2 = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height-190.5-12, SCREEN_WIDTH, 381/2)];
    }else{
        belowV2 = [[UIView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height-190.5, SCREEN_WIDTH, 381/2)];
    }
    
    belowV2.backgroundColor = [UIColor whiteColor];
    [belowV addSubview:belowV2];
    
    UIButton *canBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH/3, 40)];
    canBtn.tag = 1;
    [canBtn setTintColor:APP_COLOR];
    [canBtn setTitle:@"取消" forState:UIControlStateNormal];
    [canBtn setTitleColor:APP_COLOR forState:UIControlStateNormal];
    canBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    canBtn.titleLabel.font = [UIFont systemFontOfSize:17.0];
    [canBtn addTarget:self action:@selector(pickClick:) forControlEvents:UIControlEventTouchUpInside];
    [belowV2 addSubview:canBtn];
    
    UIButton *sureBtn = [[UIButton alloc]initWithFrame:CGRectMake(belowV2.frame.size.width-160, 0, 150, 40)];
    sureBtn.tag = 2;
    [sureBtn setTintColor:APP_COLOR];
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn setTitleColor:APP_COLOR forState:UIControlStateNormal];
    sureBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:17.0];
    [sureBtn addTarget:self action:@selector(pickClick:) forControlEvents:UIControlEventTouchUpInside];
    [belowV2 addSubview:sureBtn];
    
    NSInteger value = [_cityArrays indexOfObject:@"沪"];
    [_pickView selectRow:value+1 inComponent:0 animated:YES];
    
    UIImageView *line = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(sureBtn.frame), belowV2.frame.size.width, 0.5)];
    line.backgroundColor = [UIColor colorFromHexString:@"0xaaaaaa"];
    [belowV2 addSubview:line];
    
    _carName = @"京";
    _carName2 = @"A";
    _pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(line.frame), SCREEN_WIDTH, 150)];
    _pickView.delegate = self;
    _pickView.dataSource = self;
    _pickView.backgroundColor = [UIColor whiteColor];
    [belowV2 addSubview:_pickView];
    [_pickView reloadAllComponents];
    
}

-(void)carClick:(UIButton *)sender{
    //1 前缀 2 第一张图片 3是第二张图片
    if (sender.tag == 1) {
        [self drawBelowView];
    }else if (sender.tag == 2){
        
    }else if(sender.tag == 3){
        
    }
    
}
-(void)pickClick:(UIButton *)sender{
    
    if (sender.tag == 1) {
        
    }else if (sender.tag == 2){
        [carBnt setTitle:[NSString  stringWithFormat:@"%@%@",_carName,_carName2] forState:UIControlStateNormal];
        NSLog(@"----%@%@",_carName,_carName2);
    }
    [belowV2 removeFromSuperview];
    [belowV removeFromSuperview];
}

-(void)colorClick:(UIButton *)sender{
    
    if (arecLab.tag == 2) {
        arecLab.text  = colors[sender.tag];
    }
    
    [_colorView2 removeFromSuperview];
    [_colorView removeFromSuperview ];
}


-(void)drawColorView{
    _colorView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _colorView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [self.view addSubview:_colorView];
    
    UITapGestureRecognizer *mTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapRemoveView:)];
    [_colorView addGestureRecognizer:mTap];
    
    if (IOS7) {
        _colorView2 = [[UIView alloc]initWithFrame:CGRectMake(40, (SCREEN_HEIGHT-64-780/2)/2, SCREEN_WIDTH-80, 780/2)];
    }else{
        _colorView2 = [[UIView alloc]initWithFrame:CGRectMake(40, (SCREEN_HEIGHT-40-780/2)/2, SCREEN_WIDTH-80, 780/2)];
    }
    _colorView2.layer.cornerRadius = 4.0;
    _colorView2.backgroundColor = [UIColor whiteColor];
    [_colorView addSubview:_colorView2];
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, _colorView2.frame.size.width, 43)];
    lab.text = @"颜色";
    lab.textColor  = BGVCOLOR;
    lab.backgroundColor = [UIColor clearColor];
    lab.font = [UIFont systemFontOfSize:17.0];
    lab.textAlignment = NSTextAlignmentCenter;
    [_colorView2 addSubview:lab];
    
    UIImageView *IV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 43, _colorView2.frame.size.width-20, 0.5)];
    IV.backgroundColor = LINE9;
    [_colorView2 addSubview: IV];
    colors = @[@"白色",@"黑色",@"银色",@"黄色",@"红色",@"绿色",@"蓝色",@"其它"];
    NSArray *colorsIcon = @[@"white",@"black",@"silver",@"yello",@"red",@"green",@"bule",@"otherColor"];
    for (int i= 0; i<8; i++) {
        UIButton *btn = [[UIButton   alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(IV.frame)+i*43.5, 200, 43)];
        btn.tag = i;
        btn.backgroundColor = [UIColor clearColor];
        [btn addTarget:self action:@selector(colorClick:) forControlEvents:UIControlEventTouchUpInside];
        [_colorView2 addSubview:btn];
        
        UIImageView *btnIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 23/2, 20, 20)];
        btnIV.image = [UIImage imageNamed:colorsIcon[i]];
        btnIV.backgroundColor = [UIColor clearColor];
        [btn addSubview:btnIV];
        
        UILabel *btnLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(btnIV.frame)+10, 0, btn.frame.size.width, 43)];
        btnLab.text = colors[i];
        btnLab.textColor  = [UIColor blackColor];
        btnLab.backgroundColor = [UIColor clearColor];
        btnLab.font = [UIFont systemFontOfSize:17.0];
        btnLab.textAlignment = NSTextAlignmentLeft;
        [btn addSubview:btnLab];
        
        
        if (i != 7) {
            UIImageView *lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(btn.frame), _colorView2.frame.size.width-20, 0.5)];
            lineIV.backgroundColor = LINEE;
            [_colorView2 addSubview:lineIV];
        }
        
    }
    
}

-(void)tapRemoveView:(UITapGestureRecognizer *)recognizer{
    [_colorView2 removeFromSuperview];
    [_colorView removeFromSuperview ];
}



-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return   _cityArrays.count;
    }else if (component == 1){
        return _letterArrays.count;
    }
    return _letterArrays.count;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 30.0f;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component  {
    return self.view.frame.size.width/2-71*2;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc]init];
    }
    
    
    if (component == 0) {
        UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(0, 0.0,(pickerView.frame.size.width-71*2)/2, [pickerView rowSizeForComponent:component].height)];
        text.textAlignment = NSTextAlignmentLeft;
        text.font = [UIFont systemFontOfSize:20];
        text.backgroundColor = [UIColor clearColor];
        text.text = _cityArrays[row];
        return text;
        
    }else if(component == 1){
        
        UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake((pickerView.frame.size.width-71*2)/2+1, 0.0f, (pickerView.frame.size.width-71*2)/2, [pickerView rowSizeForComponent:component].height)];
        text.textAlignment = NSTextAlignmentRight;
        text.font = [UIFont systemFontOfSize:20];
        text.backgroundColor = [UIColor clearColor];
        text.text = _letterArrays[row];
        return text;
        
    }
    return view;
    
}
//显示标题
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *str = _letterArrays[row];
    return str;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    
    if (component == 0) {
        _carName = _cityArrays[row];
        
        [_pickView reloadComponent:1];
        
        NSInteger index = [_pickView selectedRowInComponent:1];
        _carName2 = _letterArrays[index];
        
        
    }else if(component == 1){
        
        _carName2 = _letterArrays[row];
        NSInteger index = [_pickView selectedRowInComponent:0];
        _carName = _cityArrays[index];
        [_pickView reloadComponent:0];
        
    }
}

//显示标题字体，颜色等属性
-(NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *str = _letterArrays[row];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:str];
    [attr addAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20],NSForegroundColorAttributeName:ZICOLOR} range:NSMakeRange(0, [attr length])];
    return attr;
    
}




#pragma mark 网络请求

-(void)request{
    NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:@"session_token"];
    
    NSString *url1 = [url stringByReplacingOccurrencesOfString:@"+" withString:@"%2b"];
    
    NSString *url2 = [url1 stringByReplacingOccurrencesOfString:@"/" withString:@"%2f"];
    
    NSString *url3 = [url2 stringByReplacingOccurrencesOfString:@"=" withString:@"%3d"];
    
 

    NSURL *url4 = [NSURL URLWithString:[NSString stringWithFormat:@"%@user/me/get?token=%@",DaBan_URL,url3]];
    
    NSLog(@"url4 = %@",url4);
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url4];
    
    [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
    
    [request addRequestHeader:@"Accept" value:@"application/json"];
    
    [request setRequestMethod:@"POST"];
    
    [request startSynchronous];
    
    NSError *error1 = [request error];
    if (!error1) {
        NSString *response = [request responseString];
        NSData *data = [response dataUsingEncoding:NSUTF8StringEncoding];
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        if ([[result objectForKey:@"retcode"]intValue] == 0) {
            
            NSString *tem = result[@"data"];
            NSData* myData=[tem dataUsingEncoding:NSUTF8StringEncoding];
            
            id dictionary2 = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingAllowFragments error:nil];
            
            self.model = [[MSUserModel alloc]initWithDictionary:dictionary2];
            
            NSLog(@"dic---%@",dictionary2);
        }else {
            
            [self showMyMessage:@"接口异常!"];
        }
        NSLog(@"test: %@",response);
    }
    if (!_mainTableView) {
        [self drawTableView];
    }else{
        [_mainTableView reloadData];
    }
}



//提交信息
-(void)requsetSetUser{
    
    NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:@"session_token"];
    
    NSString *url1 = [url stringByReplacingOccurrencesOfString:@"+" withString:@"%2b"];
    
    NSString *url2 = [url1 stringByReplacingOccurrencesOfString:@"/" withString:@"%2f"];
    
    NSString *url3 = [url2 stringByReplacingOccurrencesOfString:@"=" withString:@"%3d"];
    
    int i ;
    if ([_sexLabel2.text isEqualToString:@"男"]) {
        i = 1;
    }else if([_sexLabel2.text isEqualToString:@"女"]){
        i = 2;
    }
    
    NSString *str = [_nameTextField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //车牌拼接
    NSString *carlicense = [NSString stringWithFormat:@"%@%@%@",_carName,_carName2,carTxetField.text];
    
    NSString *strUrl = [NSString stringWithFormat:@"%@user/me/set?token=%@&name=%@&sex=%d&head_imgurl=%@&car_style=%@",DaBan_URL,url3,str,i,@"driv-on.png",carModelLab.text];
    
    NSLog(@"%@--%@--%@",arecLab.text,carModelLab.text,carlicense);
    NSURL *url4 = [NSURL URLWithString:strUrl];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url4];
    
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeNone];
    
    [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
    
    [request addRequestHeader:@"Accept" value:@"application/json"];
    
    [request setRequestMethod:@"POST"];
    
    [request startSynchronous];
    
    NSError *error1 = [request error];
    if (!error1) {
        NSString *response = [request responseString];
        NSData *data = [response dataUsingEncoding:NSUTF8StringEncoding];
        id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        if ([[result objectForKey:@"retcode"]intValue] == 0) {
        }else {
            [self showMyMessage:@"接口异常!"];
        }
        [SVProgressHUD dismiss];
        NSLog(@"Test: %@",response);
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 4;
    }else {
        return 3;
    }
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 0.00001;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 9;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

#pragma mark
#pragma mark UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    for (id subView in cell.contentView.subviews) {
        
        if ([subView isKindOfClass:[UIView class]]) {
            
            UIView *vie = (UIView *)subView;
            [vie removeFromSuperview];
        }
    }
    CGFloat height = 50;
    
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSArray *title1 = @[@"昵称",@"性别",@"年龄",@"职业"];
    NSArray *title2 = @[@"车牌",@"车型",@"颜色"];
    if (indexPath.section == 0) {
        UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 40, height)];
        nameLabel.font = [UIFont systemFontOfSize:16];
        nameLabel.textColor = ZIGRAY;
        nameLabel.text = title1[indexPath.row];
        nameLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:nameLabel];
        
        if (indexPath.row == 0) {
            _nameTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nameLabel.frame)+20, 0, SCREEN_WIDTH-80, height)];
            _nameTextField.delegate = self;
            _nameTextField.font = [UIFont systemFontOfSize:16];
            _nameTextField.textColor = ZIGRAY;
            _nameTextField.text = self.model.name;
            _nameTextField.tag = indexPath.row;
            _nameTextField.backgroundColor = [UIColor clearColor];
            [cell.contentView addSubview:_nameTextField];
            
        }else if (indexPath.row == 1){
            
            _sexLabel2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nameLabel.frame)+20, 0, 140, height)];
            if (self.model.sex == 1) {
                _sexLabel2.text = @"男";
            }else if (self.model.sex == 2){
                _sexLabel2.text = @"女";
            }else{
                _sexLabel2.text = @"";
            }
            _sexLabel2.font = [UIFont systemFontOfSize:16];
            _sexLabel2.textColor = ZIGRAY;
            _sexLabel2.backgroundColor = [UIColor clearColor];
            
            [cell.contentView addSubview:_sexLabel2];
        }else if (indexPath.row == 2){
            _ageTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nameLabel.frame)+20, 0, 140, height)];
            _ageTextField.delegate = self;
            _ageTextField.font = [UIFont systemFontOfSize:16];
            _ageTextField.textColor = ZIGRAY;
            _ageTextField.text = self.model.age;
            _ageTextField.tag = indexPath.row;
            _ageTextField.userInteractionEnabled = NO;
            _ageTextField.backgroundColor = [UIColor clearColor];
            [cell.contentView addSubview:_ageTextField];
            
        }else{
            _professionTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nameLabel.frame)+20, 0, 140, height)];
            _professionTextField.delegate = self;
            _professionTextField.font = [UIFont systemFontOfSize:16];
            _professionTextField.textColor = ZIGRAY;
            _professionTextField.text = self.model.profession;
            _professionTextField.tag = indexPath.row;
            _professionTextField.userInteractionEnabled = NO;
            _professionTextField.backgroundColor = [UIColor clearColor];
            [cell.contentView addSubview:_professionTextField];
        }
        
        if (indexPath.row != 3) {
            UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, height-0.5, SCREEN_WIDTH, 0.5)];
            line.backgroundColor = LINEC;
            [cell.contentView addSubview:line];
        }
        
    }else{
       
        if ([self.rolelab isEqualToString:@"我是车主"]) {
            
            
            UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 40, height)];
            nameLabel.font = [UIFont systemFontOfSize:16];
            nameLabel.textColor = ZIGRAY;
            nameLabel.text = title2[indexPath.row];
            nameLabel.backgroundColor = [UIColor clearColor];
            [cell.contentView addSubview:nameLabel];
            
            if (indexPath.row == 0) {
                carBnt = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nameLabel.frame)+20, 0, 34, height)];
                carBnt.titleLabel.font = [UIFont systemFontOfSize:16];
                [carBnt setTitle:@"前缀" forState:UIControlStateNormal];
                carBnt.tag = 1;
                carBnt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
                [carBnt setTitleColor:[UIColor colorFromHexString:@"0x3693d1"] forState:UIControlStateNormal];
                [carBnt addTarget:self action:@selector(carClick:) forControlEvents:UIControlEventTouchUpInside];
                [cell.contentView addSubview:carBnt];
                
                [arecLab removeFromSuperview];
                
                carTxetField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(carBnt.frame)+10, 0, 160, height)];
                UIColor *color = LINE9;
                if (!NULL_STR(self.model.carLicense)) {
                    carTxetField.text = self.model.carLicense;
                }else{
                    carTxetField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入" attributes:@{NSForegroundColorAttributeName: color}];
                }
                carTxetField.backgroundColor = [UIColor clearColor];
                carTxetField.font = [UIFont systemFontOfSize:16];
                carTxetField.delegate = self;
                carTxetField.textColor = ZIGRAY;
                carTxetField.keyboardType = UIKeyboardTypeNamePhonePad;
                [cell.contentView addSubview:carTxetField];
                
            }else if (indexPath.row ==1){
                carModelLab = [[UILabel alloc] init];
                carModelLab.frame = CGRectMake(CGRectGetMaxX(nameLabel.frame)+20, 0, SCREEN_WIDTH/2+60, height);
                carModelLab.textColor = LINE9;
                carModelLab.backgroundColor = [UIColor clearColor];
                carModelLab.textAlignment = NSTextAlignmentLeft;
                if (!NULL_STR(self.model.carStyle)) {
                    carModelLab.text = self.model.carStyle;
                }else{
                    carModelLab.text = _arecs[indexPath.row];
                }
                carModelLab.font = [UIFont systemFontOfSize:16];
                carModelLab.tag = indexPath.row;
                carModelLab.textColor = ZIGRAY;
                [cell.contentView addSubview:carModelLab];
            }else if(indexPath.row ==2){
                
                arecLab = [[UILabel alloc] init];
                arecLab.frame = CGRectMake(CGRectGetMaxX(nameLabel.frame)+20, 0, SCREEN_WIDTH/2, height);
                arecLab.textColor = ZIGRAY;
                arecLab.backgroundColor = [UIColor clearColor];
                arecLab.textAlignment = NSTextAlignmentLeft;
                if (!NULL_STR(self.model.carColor)) {
                    arecLab.text = self.model.carColor;
                }else{
                    arecLab.text = _arecs[indexPath.row];
                }
                arecLab.font = [UIFont systemFontOfSize:16];
                arecLab.tag = indexPath.row;
                [cell.contentView addSubview:arecLab];
                
            }
            
            if (indexPath.row != 2) {
                UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(0, height-0.5, SCREEN_WIDTH, 0.5)];
                line.backgroundColor = LINEC;
                [cell.contentView addSubview:line];
            }
        }else{
            //设置背影色删除子控件
            cell.contentView.backgroundColor = BACK_GRAY_COLOR;
        }
        
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row != 0) {
            [_nameTextField resignFirstResponder];
            [carTxetField resignFirstResponder];
            self.windowView = [[MSWindosView  alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
            self.windowView.type = 1;
            self.windowView.delegate = self;
            MSComModel *model = [[MSComModel alloc]init];
            CGFloat hight;
            if (indexPath.row == 1) {
                self.windowView.tag = 0;
                model.arecs = @[@"男",@"女"];
                model.title = @"性别";
                hight = 160;
            }else if (indexPath.row == 2){
                self.windowView.tag = 1;
                model.arecs = @[@"00后",@"90后",@"80后",@"70后",@"60后",@"50后"];
                model.title = @"年龄";
                hight = 70;
            }else if(indexPath.row == 3){
                self.windowView.tag = 2;
                model.arecs = @[@"IT",@"金融",@"美食",@"艺术",@"地产",@"科技"];
                model.title = @"职业";
                hight = 70;
            }
            self.windowView.model = model;
            self.windowView.backView2.frame = CGRectMake(self.windowView.backView2.frame.origin.x, hight, self.windowView.backView2.frame.size.width,self.windowView.backView2.frame.size.height);
            [self.view addSubview:self.windowView];
        }
    }else{
        if ([self.rolelab isEqualToString:@"我是车主"]) {
            if (indexPath.row == 1){
                MSCarTypeViewController *choice = [[MSCarTypeViewController alloc]init];
                choice.delegate = self;
                [self.navigationController pushViewController:choice animated:YES];
            
            }else if (indexPath.row == 2){
                [self drawColorView];
            }
        }
    }
    
}

//实现代理
-(void)msWindowsViewSendMSWindows:(NSInteger)tag{
    
    MSComModel *model = [[MSComModel alloc]init];
    //要保存的数据
    NSString *st = model.arecs[tag];
    if (self.windowView.tag == 0) {
        _sexLabel2.text = model.arecs[tag];
    }else if (self.windowView.tag ==1) {
        _ageTextField.text = model.arecs[tag];
    }else{
        _professionTextField.text = model.arecs[tag];
    }
    NSLog(@"场次： %@",st);
    [self.windowView removeFromSuperview];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_nameTextField resignFirstResponder];
    [carTxetField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_nameTextField resignFirstResponder];
    [carTxetField resignFirstResponder];
    return YES;
}



-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSCharacterSet *cs;
    if(textField == carTxetField)
    {
        cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        BOOL basicTest = [string isEqualToString:filtered];
        if(!basicTest)
        {
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"请输入数字与字母"
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
            
            [alert show];
            
            return NO;
        }
         textField.text = [textField.text uppercaseString];
        
        if (carTxetField.text.length>5) {
            textField.text = [carTxetField.text substringToIndex:5];
            return NO;
        }
    }
   
    return YES;
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if (textField == carTxetField) {
        CGFloat offset = self.view.frame.size.height - (textField.frame.origin.y+textField.frame.size.height+216+53+203+5);
        NSLog(@"%f--%f--%f--%f",offset,self.view.frame.size.height,textField.frame.origin.y,textField.frame.size.height);
        if (offset<=0) {
            [UIView animateWithDuration:0.3 animations:^{
                CGRect fram = self.view.frame;
                fram.origin.y = offset-60;
                self.view.frame = fram;
            }];
        }
        
        return YES;
    }
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    if (textField == carTxetField){
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = self.view.frame;
            if (iPhone3GS||iPhone4||iPhone4s) {
                frame.origin.y = 0;
            }else{
                frame.origin.y = 62;
            }
            self.view.frame = frame;
        }];
        return YES;
    }
    return YES;
}


-(void)photo:(UIGestureRecognizer *)sender{
    [self PhotoImage];
}

- (void)PhotoImage
{
    backView_1= [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-49)];
    backView_1.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [self.view addSubview:backView_1];
    
    bgV = [[UIView   alloc]initWithFrame:CGRectMake(8, 344, SCREEN_WIDTH-16, 88.5)];
    bgV.backgroundColor = [UIColor whiteColor];
    bgV.layer.cornerRadius  = 3;
    
    [self.view addSubview:bgV];
    
    
    UIButton  *imageButton = [[UIButton alloc]initWithFrame:CGRectMake(4, 0, SCREEN_WIDTH-20, 44)];
    imageButton.layer.cornerRadius = 3;
    imageButton.backgroundColor = [UIColor whiteColor];
    [imageButton setTitleColor:[UIColor colorFromHexString:@"0x037bff"] forState:UIControlStateNormal];
    [imageButton setTitle:@"拍照" forState:UIControlStateNormal];
    [imageButton addTarget:self action:@selector(photoClick) forControlEvents:UIControlEventTouchUpInside];
    [bgV addSubview:imageButton];
    
    UIImageView *line = [[UIImageView alloc]initWithFrame:CGRectMake(0, 45, bgV.frame.size.width, 0.5)];
    line.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [bgV addSubview:line];
    
    UIButton  *photoButton = [[UIButton alloc]initWithFrame:CGRectMake(4, 46, SCREEN_WIDTH-20, 44)];
    photoButton.layer.cornerRadius = 3;
    photoButton.backgroundColor = [UIColor whiteColor];
    [photoButton setTitleColor:[UIColor colorFromHexString:@"0x037bff"] forState:UIControlStateNormal];
    [photoButton setTitle:@"相册" forState:UIControlStateNormal];
    [photoButton addTarget:self action:@selector(headClick) forControlEvents:UIControlEventTouchUpInside];
    [bgV addSubview:photoButton];
    
    UIButton  *removeButton = [[UIButton alloc]initWithFrame:CGRectMake(8, SCREEN_HEIGHT - 60 - 64, SCREEN_WIDTH-16, 44)];
    removeButton.layer.cornerRadius = 3;
    removeButton.backgroundColor = [UIColor whiteColor ];
    [removeButton setTitleColor:[UIColor colorFromHexString:@"0x037bff"] forState:UIControlStateNormal];
    [removeButton setTitle:@"取消" forState:UIControlStateNormal];
    [removeButton addTarget:self action:@selector(removeClick) forControlEvents:UIControlEventTouchUpInside];
    [backView_1 addSubview:removeButton];
    
    if (SCREEN_HEIGHT<568.0f) {
        imageButton.frame = CGRectMake(20, SCREEN_HEIGHT - 200 - 64, SCREEN_WIDTH-40, 40);
        photoButton.frame = CGRectMake(20, SCREEN_HEIGHT - 150 - 64, SCREEN_WIDTH-40, 40);
        removeButton.frame = CGRectMake(20, SCREEN_HEIGHT - 95 - 64, SCREEN_WIDTH-40, 40);
    }
    
}

//相册
- (void)headClick
{
    UIImagePickerController *pickerImage = [[UIImagePickerController alloc] init];
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        pickerImage.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        pickerImage.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:pickerImage.sourceType];
        
    }
    
    pickerImage.delegate = self;
    pickerImage.allowsEditing = YES;
    [self presentViewController:pickerImage animated:YES completion:nil];
    
    
    [bgV removeFromSuperview];
    [backView_1 removeFromSuperview];
}


//拍照
- (void)photoClick
{
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    
    if (![UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
        
        NSLog(@"该设备无摄像头");
        sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
    }
    
    //初始化
    imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    //设置可编辑
    imagePicker.allowsEditing = YES;
    imagePicker.sourceType = sourceType;
    //进入照相界面
    [self presentViewController:imagePicker animated:YES completion:nil];
    
    [bgV removeFromSuperview];
    [backView_1 removeFromSuperview];
}

- (void)removeClick
{
    [bgV removeFromSuperview];
    [backView_1 removeFromSuperview];
}

#pragma mark -
#pragma UIImagePickerController Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //    [SVProgressHUD show];
    UIImage *imgs = [info objectForKey:UIImagePickerControllerEditedImage];
    [self performSelector:@selector(saveImage:)  withObject:imgs afterDelay:0.5];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveImage:(UIImage *)image {
    //    NSLog(@"保存头像！");
    //    [userPhotoButton setImage:image forState:UIControlStateNormal];
    BOOL success;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    imageFilePath = [documentsDirectory stringByAppendingPathComponent:@"selfPhoto.jpg"];
    NSLog(@"imageFile->>%@",imageFilePath);
    success = [fileManager fileExistsAtPath:imageFilePath];
    [self performSelector:@selector(uploadImageTo) withObject:nil afterDelay:1.0];
    success = [fileManager removeItemAtPath:imageFilePath error:&error];
    
    UIImage *smallImage = [self thumbnailWithImageWithoutScale:image size:CGSizeMake(260, 260)];
    [UIImageJPEGRepresentation(smallImage, 1.0f) writeToFile:imageFilePath atomically:YES];//写入文件
    UIImage *selfPhoto = [UIImage imageWithContentsOfFile:imageFilePath];//读取图片文件
    //    [userPhotoButton setImage:selfPhoto forState:UIControlStateNormal];
    img.image = selfPhoto;
}

//2.保持原来的长宽比，生成一个缩略图
- (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize
{
    UIImage *newimage;
    if (nil == image) {
        newimage = nil;
    }
    else{
        CGSize oldsize = image.size;
        CGRect rect;
        if (asize.width/asize.height > oldsize.width/oldsize.height) {
            rect.size.width = asize.height*oldsize.width/oldsize.height;
            rect.size.height = asize.height;
            rect.origin.x = (asize.width - rect.size.width)/2;
            rect.origin.y = 0;
        }
        else{
            rect.size.width = asize.width;
            rect.size.height = asize.width*oldsize.height/oldsize.width;
            rect.origin.x = 0;
            rect.origin.y = (asize.height - rect.size.height)/2;
        }
        UIGraphicsBeginImageContext(asize);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));//clear background
        [image drawInRect:rect];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
}

-(void)uploadImageTo
{
    
    //检查网络
    if (![[Reachability reachabilityForInternetConnection] isReachable]) {
        UIAlertView *alertViews = [[UIAlertView alloc] initWithTitle:@"该功能需要连接网络才能使用，请检查您的网络连接状态" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertViews show];
        return;
    }

    NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:@"session_token"];
    
    NSString *url1 = [url stringByReplacingOccurrencesOfString:@"+" withString:@"%2b"];
    
    NSString *url2 = [url1 stringByReplacingOccurrencesOfString:@"/" withString:@"%2f"];
    
    NSString *url3 = [url2 stringByReplacingOccurrencesOfString:@"=" withString:@"%3d"];
    
    UIImage *_originImage = [UIImage imageWithContentsOfFile:imageFilePath];
    
    NSData *_data = UIImagePNGRepresentation(_originImage);
    
    NSString *_encodedImageStr = [_data base64Encoding];
    
    NSURL *url4 = [NSURL URLWithString: [NSString stringWithFormat:@"%@image/upload?token=%@&type=1&imgext=png&data=%@",IMAGE_URL,url3,_encodedImageStr]];
    
    NSLog(@"url3 =%@",url4);
    
    NSMutableData *imageData = [NSMutableData dataWithData:_data];
    ASIFormDataRequest *request = [[ASIFormDataRequest alloc] initWithURL:url4];
    [request setDelegate:self];//代理
    [request setRequestMethod:@"POST"];
    [request setPostBody:imageData];
//    [request addRequestHeader:@"imgext" value:@"png/jpeg"];//这里的value值 需与服务器端 一致
    
    [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
    [request addRequestHeader:@"Accept" value:@"application/json"];
    
    [request startAsynchronous];//开始。异步
    [request setDidFinishSelector:@selector(ok)];
    [request setDidFailSelector:@selector(no)];
    
    
    NSError *err = [request error];
    if (!err) {
        NSString *response = [request responseString];
        NSLog(@"test : %@",response);
    }

  
}

-(void)ok{
   headView.headImgV.image = [UIImage imageWithContentsOfFile:imageFilePath];
    
}
-(void)no{
    NSLog(@"ononono");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
