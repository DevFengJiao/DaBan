//
//  MSAddCarViewController.m
//  DaBan
//
//  Created by qkm on 15-8-5.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSAddCarViewController.h"
#import "MSChoiceCarViewController.h"
#import "MSCarCell.h"
#import "MSCarModel.h"
#import "MessageNoteCell.h"

@interface MSAddCarViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{
    UITableView        *_tableView;
    NSArray            *_titles;
    NSArray            *_arecs;
    UITextField        *carTxetField;
    UIButton           *_imageBtn;
    UILabel            *arecLab;
    UIView             *belowV;
    UIView             *belowV2;
    UIPickerView       *_pickView;
    NSArray            *_cityArrays;
    NSArray            *_letterArrays;
    
    NSString           *_carName;
    NSString           *_carName2;
    UIButton           *carBnt;
    
    UIView             *_colorView;
    UIView             *_colorView2;
    NSArray            *colors;
}
@end


@implementation MSAddCarViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加爱车";

   
   
    [self drawTableView];
    _titles = @[@"车牌",@"车型",@"颜色"];

    
    
    
   [self setNavigationBarRightbutton];
    
}

-(void)setNavigationBarRightbutton{
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(5, 0, 20, 15);
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"sure.png"] forState:UIControlStateNormal];
    
    [rightBtn setTintColor:[UIColor whiteColor]];
    [rightBtn addTarget:self action:@selector(rightBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    //    [self.navigationItem.rightBarButtonItem setCustomView:rightBtn];
    self.editButton = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
    self.navigationItem.rightBarButtonItem = self.editButton; 
}

-(void)rightBtnAction: (UIButton *)sender{
    //显示多选圆圈
   
    
}

-(void)drawTableView{

    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 43*3-1)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = UIColorFromRGB(0xDFDFDD);
//        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.scrollEnabled = NO;
        [self.view addSubview:_tableView];
    }
    
    [self drawView];
    
}

-(void)drawView{
    UIView *bgV = [[UIView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_tableView.frame)+5, SCREEN_WIDTH-20, 180)];
    bgV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgV];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(10, 0, 150, 30);
    titleLabel.textColor = ZICOLOR;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.text = @"上传爱车照片";
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.numberOfLines = 0;
    [bgV addSubview:titleLabel];
    
    UIImageView *lineV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 30, bgV.frame.size.width-20, 0.5)];
    lineV.backgroundColor = LINEE;
    [bgV addSubview:lineV];
    
    for (int i=0; i<2; i++) {
        _imageBtn = [[UIButton alloc]initWithFrame:CGRectMake(10 + i*((bgV.frame.size.width-30)/2+10), CGRectGetMaxY(lineV.frame)+10, (bgV.frame.size.width-30)/2, 100)];
        _imageBtn.tag = i+2;
       
        [_imageBtn addTarget:self action:@selector(carClick:) forControlEvents:UIControlEventTouchUpInside];
        [_imageBtn setImage:[UIImage imageNamed:@"我的资料-添加图片@2x.png"] forState:UIControlStateNormal];
        [bgV addSubview:_imageBtn];
    }
    
    bgV.frame = CGRectMake(bgV.frame.origin.x, bgV.frame.origin.y, bgV.frame.size.width, CGRectGetMaxY(_imageBtn.frame)+10);
}

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
    [canBtn setTintColor:BGVCOLOR];
    [canBtn setTitle:@"取消" forState:UIControlStateNormal];
    [canBtn setTitleColor:BGVCOLOR forState:UIControlStateNormal];
    canBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    canBtn.titleLabel.font = [UIFont systemFontOfSize:17.0];
    [canBtn addTarget:self action:@selector(pickClick:) forControlEvents:UIControlEventTouchUpInside];
    [belowV2 addSubview:canBtn];
    
    UIButton *sureBtn = [[UIButton alloc]initWithFrame:CGRectMake(belowV2.frame.size.width-160, 0, 150, 40)];
    sureBtn.tag = 2;
    [sureBtn setTintColor:BGVCOLOR];
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn setTitleColor:BGVCOLOR forState:UIControlStateNormal];
    sureBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:17.0];
    [sureBtn addTarget:self action:@selector(pickClick:) forControlEvents:UIControlEventTouchUpInside];
    [belowV2 addSubview:sureBtn];
    
    NSInteger value = [_cityArrays indexOfObject:@"沪"];
    [_pickView selectRow:value+1 inComponent:0 animated:YES];
    
    UIImageView *line = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(sureBtn.frame), belowV2.frame.size.width, 0.5)];
    line.backgroundColor = [UIColor colorFromHexString:@"0xaaaaaa"];
    [belowV2 addSubview:line];
    
    _pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(line.frame), SCREEN_WIDTH, 150)];
    _pickView.delegate = self;
    _pickView.dataSource = self;
    _pickView.backgroundColor = [UIColor whiteColor];
    [belowV2 addSubview:_pickView];
    [_pickView reloadAllComponents];

}

-(void)drawColorView{
    _colorView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    _colorView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [self.view addSubview:_colorView];
    
    if (IOS7) {
       _colorView2 = [[UIView alloc]initWithFrame:CGRectMake(20, 177/2-64, SCREEN_WIDTH-40, 780/2)];
    }else{
       _colorView2 = [[UIView alloc]initWithFrame:CGRectMake(20, 177/2-40, SCREEN_WIDTH-40, 780/2)];
    }
   
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
        
        
        if (i != i-1) {
            UIImageView *lineIV = [[UIImageView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(btn.frame), _colorView2.frame.size.width-20, 0.5)];
            lineIV.backgroundColor = LINEE;
            [_colorView2 addSubview:lineIV];
        }
 
    }
    
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




#pragma mark---tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 3;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 43;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    static NSString *CellIdentifier = @"MSCarCell";
//    MSCarCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[MSCarCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//    MSCarModel *model = [[MSCarModel alloc]init];
//    model.title = _titles[indexPath.row];
//    model.arce = @"1111";
//    cell.model = model;

    CGFloat pointH = cell.contentView.frame.size.height;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(10, 0, 34, pointH);
    titleLabel.textColor = ZICOLOR;
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.text = _titles[indexPath.row];
    titleLabel.font = [UIFont systemFontOfSize:17];
    titleLabel.numberOfLines = 0;
    [cell.contentView addSubview:titleLabel];
    
    
    
    arecLab = [[UILabel alloc] init];
    arecLab.frame = CGRectMake(CGRectGetMaxX(titleLabel.frame)+20, 0, SCREEN_WIDTH/2, pointH);
    arecLab.textColor = LINE9;
    arecLab.backgroundColor = [UIColor clearColor];
    arecLab.textAlignment = NSTextAlignmentLeft;
    arecLab.text = _arecs[indexPath.row];
    arecLab.font = [UIFont systemFontOfSize:17];
    arecLab.tag = indexPath.row;
    [cell.contentView addSubview:arecLab];
    
    if (indexPath.row==0) {
        carBnt = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleLabel.frame)+20, 0, 34, pointH)];
        carBnt.titleLabel.font = [UIFont systemFontOfSize:17];
        [carBnt setTitle:@"前缀" forState:UIControlStateNormal];
        carBnt.tag = 1;
        carBnt.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [carBnt setTitleColor:[UIColor colorFromHexString:@"0xab78c"] forState:UIControlStateNormal];
        [carBnt addTarget:self action:@selector(carClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:carBnt];
        
        [arecLab removeFromSuperview];
        
        carTxetField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(carBnt.frame)+10, arecLab.frame.origin.y, 160, arecLab.frame.size.height)];
         UIColor *color = LINE9;
        carTxetField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入" attributes:@{NSForegroundColorAttributeName: color}];
        carTxetField.backgroundColor = [UIColor clearColor];
        carTxetField.font = [UIFont systemFontOfSize:17];
        carTxetField.delegate = self;
        [cell.contentView addSubview:carTxetField];

        
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    }
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //  ActiUserInfo *userInfo =  [self.actiInfo.actiUserArray objectAtIndex:indexPath.row];
    if (indexPath.row == 0) {
        
    }else if (indexPath.row == 1){
        MSChoiceCarViewController *choice = [[MSChoiceCarViewController alloc]init];
        [self.navigationController pushViewController:choice animated:YES];
        
    }else if (indexPath.row == 2){
        [self drawColorView];
    }
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
        arecLab.textColor = ZICOLOR;
        arecLab.text  = colors[sender.tag];
        
    }
   
    [_colorView2 removeFromSuperview];
    [_colorView removeFromSuperview ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [carTxetField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [carTxetField resignFirstResponder];
    return YES;
}


@end
