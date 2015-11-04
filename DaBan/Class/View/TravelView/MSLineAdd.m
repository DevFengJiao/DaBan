//
//  MSLineAdd.m
//  DaBan
//
//  Created by qkm on 15-8-14.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSLineAdd.h"


@implementation MSLineAdd

-(id)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
    
}

-(void)setUp{
    
    self.days = @[@"今天",@"明天"];
    
    self.hours = @[@"00",@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23"];
    
    self.mins = @[@"00",@"05",@"10",@"15",@"20",@"25",@"30",@"35",@"40",@"45",@"50",@"55"];
    
    UIImageView *bgV1 = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, SCREEN_WIDTH-20, 187/2)];
    bgV1.backgroundColor = [UIColor clearColor];
    bgV1.image = [UIImage   imageNamed:@"addLine-place.png"];
    bgV1.userInteractionEnabled = YES;
    [self addSubview:bgV1];

    self.endImageV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 25, 25)];
    self.endImageV.backgroundColor = [UIColor clearColor];
    self.endImageV.image = [UIImage   imageNamed:@"addLine-end"];
    [bgV1 addSubview:self.endImageV];
    
    self.endBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.endImageV.frame)+10, 0, SCREEN_WIDTH-50, 46)];
    [self.endBtn setTitle:@"输入终点" forState:UIControlStateNormal];
    self.endBtn.backgroundColor = [UIColor clearColor];
    self.endBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.endBtn setTitleColor:ZIGRAY forState:UIControlStateNormal];
    [self.endBtn.titleLabel setFont:[UIFont systemFontOfSize:17.0 ]];
    
    [bgV1 addSubview:self.endBtn];
    
    UILabel *line = [[UILabel alloc]initWithFrame:CGRectMake(self.endBtn.frame.origin.x, 46,493/2, 0.5)];
    line.backgroundColor = [UIColor colorFromHexString:@"0xc8c8c8"];
    [bgV1  addSubview:line];
    
    UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(10+12.5-2.5, 10+25+5, 5, 15)];
    img.backgroundColor = [UIColor clearColor];
    img.image = [UIImage imageNamed:@"addLine-core"];
    [bgV1 addSubview:img];
    
    
    
    self.startImageV = [[UIImageView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(img.frame)+5, 25, 25)];
    self.startImageV.backgroundColor = [UIColor clearColor];
    self.startImageV.image = [UIImage   imageNamed:@"addLine-start"];
    [bgV1 addSubview:self.startImageV];
    
    self.startBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.startImageV.frame)+10,46.5, SCREEN_WIDTH-20, 51)];
    NSLog(@"%2.f",SCREEN_WIDTH);
    [self.startBtn setTitle:@"输入起点" forState:UIControlStateNormal];
    self.startBtn.backgroundColor = [UIColor clearColor];
    self.startBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [self.startBtn setTitleColor:ZIGRAY forState:UIControlStateNormal];
    [self.startBtn.titleLabel setFont:[UIFont systemFontOfSize:17.0 ]];
    [bgV1 addSubview:self.startBtn];
    
    
    self.bgV2 = [[UIImageView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(bgV1.frame)+10, SCREEN_WIDTH-20, 302/2)];
    self.bgV2.backgroundColor = [UIColor clearColor];
    self.bgV2.image = [UIImage   imageNamed:@"addLine-place.png"];
    self.bgV2.userInteractionEnabled = YES;
    [self addSubview:self.bgV2];
    

    
    UIImageView *bgV3 = [[UIImageView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.bgV2.frame)+10, SCREEN_WIDTH-20, 102/2)];
    bgV3.backgroundColor = [UIColor clearColor];
    bgV3.image = [UIImage   imageNamed:@"addLine-place.png"];
    bgV3.userInteractionEnabled = YES;
    [self addSubview:bgV3];
    
    UILabel *moneyLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 14*3, 14)];
    moneyLab.backgroundColor = [UIColor clearColor];
    moneyLab.textColor = ZICOLOR;
    moneyLab.text  = @"平摊费";
    moneyLab.font = [UIFont systemFontOfSize:14];
    [bgV3 addSubview:moneyLab];
    
    UIButton *moenyBtn = [[UIButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(moneyLab.frame)+5, 10, 15, 15)];
    moenyBtn.backgroundColor = [UIColor clearColor];
    [moenyBtn setImage:[UIImage imageNamed:@"addLine-help"]forState:UIControlStateNormal];
    [moenyBtn addTarget:self action:@selector(helpClick) forControlEvents:UIControlEventTouchUpInside];
    
    [bgV3 addSubview:moenyBtn];
    
    self.moneyLab2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 10+CGRectGetMaxY(moneyLab.frame), 150, 12)];
    self.moneyLab2.backgroundColor = [UIColor clearColor];
    self.moneyLab2.textColor = ZICOLOR;
    self.moneyLab2.font = [UIFont systemFontOfSize:12];
    [bgV3 addSubview:self.moneyLab2];
    
    
    self.moneyLab3 = [[UILabel alloc]initWithFrame:CGRectMake(bgV3.frame.size.width-100, CGRectGetMaxY(moneyLab.frame), 90, 17)];
    self.moneyLab3.backgroundColor = [UIColor clearColor];
    self.moneyLab3.textColor = [UIColor colorFromHexString:@"0xda4a4a"];
    
    self.moneyLab3.textAlignment = NSTextAlignmentRight;
    self.moneyLab3.font = [UIFont systemFontOfSize:17.0];
    [bgV3 addSubview:self.moneyLab3];

    
    self.bgV4 = [[UIButton alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(bgV3.frame)+10, SCREEN_WIDTH-20, 102/2)];
    self.bgV4.backgroundColor = [UIColor clearColor];
    [self.bgV4  setBackgroundImage:[UIImage imageNamed:@"addLine-place.png"]forState:UIControlStateNormal];

    [self addSubview:self.bgV4];
    
    UILabel *conentLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 9.5, 150, 14)];
    conentLab.backgroundColor = [UIColor clearColor];
    conentLab.textColor = ZICOLOR;
    conentLab.text  = @"给车主捎句话";
    conentLab.font = [UIFont systemFontOfSize:14];
    [self.bgV4 addSubview:conentLab];
    
    self.conentLab1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 9.5+CGRectGetMaxY(conentLab.frame), 150, 12)];
    self.conentLab1.backgroundColor = [UIColor clearColor];
    self.conentLab1.textColor = ZICOLOR;
    self.conentLab1.font = [UIFont systemFontOfSize:12];
    [self.bgV4 addSubview:self.conentLab1];
    
    UIImageView *arrowImg = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.bgV4.frame)-30, 37/2, 10, 15)];
    arrowImg.backgroundColor = [UIColor clearColor];
    arrowImg.image  = [UIImage imageNamed:@"arrow-r"];
    [self.bgV4 addSubview:arrowImg];
    
    
    self.addBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, SCREEN_HEIGHT-50-64, SCREEN_WIDTH-20, 40)];
    [self.addBtn setTitle:@"立即发布" forState:UIControlStateNormal];
    self.addBtn.backgroundColor = BGVCOLOR;
    [self.addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.addBtn.titleLabel setFont:[UIFont systemFontOfSize:17.0 ]];
    self.addBtn.layer.cornerRadius = 3;
    [self addSubview:self.addBtn];
    
    
   //    [self drawPickView];
    [self drawDatePicker];
}

-(void)helpClick{

}

-(void)setModelLine:(MSLineModel *)modelLine{
    _modelLine = modelLine;
    self.conentLab1.text = modelLine.content;
    self.moneyLab2.text  = [NSString stringWithFormat:@"约%.1f公里,打车约%.0f元",modelLine.length,modelLine.length*5];
    self.moneyLab3.text  = [NSString stringWithFormat:@"%.1f",modelLine.price];
}


-(void)drawPickView{
    
    _pickView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, self.bgV2.frame.size.width, self.bgV2.frame.size.height)];
    _pickView.delegate = self;
    _pickView.dataSource = self;
    _pickView.backgroundColor = [UIColor clearColor];
    [self.bgV2 addSubview:_pickView];
    [_pickView reloadAllComponents];
    
}

-(void)drawDatePicker{
    _dataPicker = [[UIDatePicker alloc]init];
    _dataPicker.frame = CGRectMake(0, 0, self.bgV2.frame.size.width, self.bgV2.frame.size.height);
    _dataPicker.datePickerMode = UIDatePickerModeDateAndTime;
    _dataPicker.backgroundColor = [UIColor clearColor];
    
    
    [_dataPicker addTarget:self action:@selector(dataChanged:) forControlEvents:UIControlEventValueChanged];
    //设置显示格式 为中文
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    _dataPicker.locale = locale;
    
    NSDate *localDate = [NSDate date];
    
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // 当前时间加上的时间：格力高利历
    //    NSCalendar *gregorian = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    //    NSDateComponents *offsetComponents = [[NSDateComponents alloc]init];
    //    //设置时间
    //
    //    [offsetComponents setMonth:0];
    //    [offsetComponents setDay:0];
    //    [offsetComponents setHour:0];
    //    [offsetComponents setMinute:0];
    //    [offsetComponents setSecond:0];
    //    NSDate *maxDate = [gregorian dateByAddingComponents:offsetComponents toDate:localDate options:0];
    self.dataPicker.minimumDate = localDate;
    self.dataPicker.maximumDate = [formatter dateFromString:@"2020-04-01 00:00:00"];
    [self.bgV2 addSubview:_dataPicker];


}

-(void)dataChanged:(id)sender{
    UIDatePicker *control = (UIDatePicker *)sender;
    NSDate *date = control.date;
//    NSLog(@"%@",date);
    NSDateFormatter *pickerformatter = [[NSDateFormatter alloc]init];
    [pickerformatter setDateFormat:@"yyyy年MM月dd日(EEEE) HH:mm:ss"];
    NSString *dateString = [pickerformatter stringFromDate:date];
    NSLog(@"格式化显示时间:%@",dateString);

//    时间转时间戳的方法:
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
    MSLineModel *model = [[MSLineModel alloc]init];
    model.start_time = [timeSp intValue];
    NSLog(@"timeSp:%@",timeSp); //时间戳的值
    
    if (self.delegate&&[self.delegate respondsToSelector:@selector(mslineAddDelegate:)]) {
        [self.delegate mslineAddDelegate:[timeSp intValue]];
    }
    
    //显示当前选中的时间
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
//    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:date];
//    
////    int year = [dateComponent year];
//    int month = [dateComponent month];
//    int day = [dateComponent day];
//    int hour = [dateComponent hour];
//    int minute = [dateComponent minute];
//    int second = [dateComponent second];


}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0) {
        return   _days.count;
    }else if (component == 1){
        return _hours.count;
    }else if(component == 2){
        return _mins.count;
    }
    return 2;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    
    return 30.0f;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component  {
    return self.frame.size.width/5;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc]init];
    }
    
    
    if (component == 0) {
        UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(0, 0.0,(pickerView.frame.size.width-71*2)/3, [pickerView rowSizeForComponent:component].height)];
        text.textAlignment = NSTextAlignmentLeft;
        text.font = [UIFont systemFontOfSize:20];
        text.backgroundColor = [UIColor clearColor];
        text.text = _days[row];
        return text;
        
    }else if(component == 1){
        
        UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake((pickerView.frame.size.width-71*2)/2+1, 0.0f, (pickerView.frame.size.width-71*2)/3, [pickerView rowSizeForComponent:component].height)];
        text.textAlignment = NSTextAlignmentRight;
        text.font = [UIFont systemFontOfSize:20];
        text.backgroundColor = [UIColor clearColor];
        text.text = _hours[row];
        return text;
        
    }else if (component == 2){
        UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake((pickerView.frame.size.width-71*2)/3*2+30, 0.0f, (pickerView.frame.size.width-71*2)/3, [pickerView rowSizeForComponent:component].height)];
        text.textAlignment = NSTextAlignmentRight;
        text.font = [UIFont systemFontOfSize:20];
        text.backgroundColor = [UIColor clearColor];
        text.text = _mins[row];
        return text;
        
    }
    return view;
    
}
//显示标题
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *str = _days[row];
    return str;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSString *name1,*name2,*name3;
    
    if (component == 0) {
        name1 = _days[row];
        
        [_pickView reloadComponent:1];
        
        NSInteger index = [_pickView selectedRowInComponent:1];
        name2 = _hours[index];
        
        NSInteger index2 = [_pickView selectedRowInComponent:2];
        name3 = _mins[index2];
        
    }else if(component == 1){
        
        name2 = _hours[row];
        NSInteger index = [_pickView selectedRowInComponent:0];
        name1 = _days[index];
        
        NSInteger index2 = [_pickView selectedRowInComponent:2];
        name3 = _mins[index2];
        [_pickView reloadComponent:0];
        
    }else if(component == 2){
        name3 = _mins[row];
        NSInteger index = [_pickView selectedRowInComponent:0];
        name1 = _days[index];
        
        NSInteger index2 = [_pickView selectedRowInComponent:1];
        name2 = _hours[index2];
    }
    
    if (self.delegate&&[self.delegate respondsToSelector:@selector(mslineAddDelegate:and:adn:)]) {
        [self.delegate mslineAddDelegate:name1 and:name2 adn:name3];
    }
    
}

//显示标题字体，颜色等属性
-(NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSString *str = _days[row];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc]initWithString:str];
    [attr addAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:20],NSForegroundColorAttributeName:ZICOLOR} range:NSMakeRange(0, [attr length])];
    return attr;
    
}



@end
