//
//  MSLoginViewController.m
//  DaBan
//
//  Created by qkm on 15-7-31.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSLoginViewController.h"
#import "MSComModel.h"
#import "MSUserViewController.h"
#import "MSMyViewController.h"
#import "UMSocial.h"

#define NUMBERS @"0123456789\n"

@interface MSLoginViewController ()
@property (nonatomic, assign) BOOL isAgree;

@end

@implementation MSLoginViewController

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController.navigationBar setBarTintColor:APP_COLOR];
      NSDictionary * dict = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    [self.navigationController.navigationBar setTitleTextAttributes:dict];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController.navigationBar setBarTintColor:APP_NACOLOR];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:ZI_NACOLOR,UITextAttributeTextColor,nil]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"搭伴";
    
    // 左返回按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame =CGRectMake(-10, 0, 32, 32);
    
    btn.backgroundColor = [UIColor clearColor];
    
    [btn addTarget: self action: @selector(exitAction) forControlEvents: UIControlEventTouchUpInside];
    
    UIBarButtonItem* item=[[UIBarButtonItem alloc]initWithCustomView:btn];
    
    UIImageView *iconIV = [[UIImageView alloc]initWithFrame:CGRectMake(-10, 5, 22, 22)];
    iconIV.backgroundColor = [UIColor clearColor];
    UIImage *image = [UIImage imageNamed:@"pic_login_back2"];
    iconIV.image = image;
    [btn addSubview:iconIV];
    self.navigationItem.leftBarButtonItem=item;

    self.view.backgroundColor = [UIColor whiteColor];
    
    
    [self darwView];
    
}

-(void)exitAction{
    [self.navigationController popViewControllerAnimated:YES];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    if (textField == codeTextField) {
        CGFloat offset = self.view.frame.size.height - (textField.frame.origin.y+textField.frame.size.height+216+53+203+5);
        if (offset<=0) {
            [UIView animateWithDuration:0.3 animations:^{
                CGRect fram = self.view.frame;
                fram.origin.y = 30;
                self.view.frame = fram;
            }];
        }
        
        return YES;
    }
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    if (textField == codeTextField){
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame = self.view.frame;
            if (iPhone3GS||iPhone4||iPhone4s) {
                frame.origin.y = 0;
            }else{
                frame.origin.y = 60;
            }
            self.view.frame = frame;
        }];
        return YES;
    }
    return YES;
}

-(void)darwView{

    UIView *iconView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 170)];
    iconView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:iconView];
    
    UIButton *blackBtn = [[UIButton alloc]initWithFrame:CGRectMake(10, 30, 42, 42)];
//    [blackBtn setImage:[UIImage imageNamed:@"01-2返回@2x.png"] forState:UIControlStateNormal];
    blackBtn.backgroundColor = [UIColor clearColor];
    [blackBtn addTarget:self action:@selector(blackAction:) forControlEvents:UIControlEventTouchUpInside];
//    [iconView addSubview:blackBtn];
    
    UIImageView *blackiv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 22, 22)];
    blackiv.backgroundColor = [UIColor clearColor];
    blackiv.image  = [UIImage imageNamed:@"01-2返回@2x.png"];
//    [blackBtn addSubview:blackiv];
    
    UIImageView *iconImgV = [[UIImageView alloc]initWithFrame:CGRectMake(210/2, 40, SCREEN_WIDTH-210, SCREEN_WIDTH-210)];
    iconImgV.backgroundColor = [UIColor clearColor];
    iconImgV.image = [UIImage   imageNamed:@"形状-4.png"];
    [iconView  addSubview:iconImgV];
    
    UIView *textBgV = [[UIView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(iconView.frame), SCREEN_WIDTH-20, 92+1)];
    textBgV.backgroundColor = [UIColor clearColor];
    [self.view addSubview:textBgV];

    UIImageView *telImgV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 16/2, 30, 30)];
    telImgV.backgroundColor = [UIColor clearColor];
    telImgV.image = [UIImage   imageNamed:@"tel"];
//    [textBgV  addSubview:telImgV];
    
    UIColor *color = LINE9;
    telTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 10, textBgV.frame.size.width-60, 35)];
    telTextField.backgroundColor = [UIColor clearColor];
    telTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"手机号" attributes:@{NSForegroundColorAttributeName: color}];
    telTextField.tag = 10;
    telTextField.keyboardType = UIKeyboardTypeNumberPad;
    telTextField.delegate = self;
    telTextField.font = [UIFont systemFontOfSize:17.0];
    
    [textBgV addSubview:telTextField];
    
    UIImageView *line = [[UIImageView alloc]initWithFrame:CGRectMake(10, telTextField.frame.size.height+telTextField.frame.origin.y, textBgV.frame.size.width-20, 1)];
    line.backgroundColor = LINEE;
   
    [textBgV addSubview:line];
    
    UIImageView *codeImgV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 54, 30, 30)];
    codeImgV.backgroundColor = [UIColor clearColor];
    codeImgV.image = [UIImage   imageNamed:@"code@2x"];
//    [textBgV  addSubview:codeImgV];
    
    codeTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 57, textBgV.frame.size.width-120, 35)];
    codeTextField.backgroundColor = [UIColor clearColor];
    codeTextField.placeholder = @"验证码";
    codeTextField.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@"验证码" attributes:@{NSForegroundColorAttributeName:color}];
    codeTextField.tag = 11;
    codeTextField.keyboardType = UIKeyboardTypeNumberPad;
    codeTextField.delegate = self;
    codeTextField.font = [UIFont systemFontOfSize:17.0];
    [textBgV addSubview:codeTextField];
    
    UIImageView *line2 = [[UIImageView alloc]initWithFrame:CGRectMake(10, codeTextField.frame.size.height+codeTextField.frame.origin.y, textBgV.frame.size.width-20-12-90, 1)];
    line2.backgroundColor = LINEE;
    [textBgV addSubview:line2];
    
    valiButton = [[UIButton alloc]initWithFrame:CGRectMake(textBgV.frame.size.width-10-90,46+8+8,90,30)];
//    [valiButton setBackgroundImage:[UIImage imageNamed:@"btnLog@2x"]forState:UIControlStateNormal];
    valiButton.backgroundColor = APP_COLOR;
    [valiButton setTitle:@"验     证" forState:UIControlStateNormal];
    valiButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    valiButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
    valiButton.tintColor = [UIColor whiteColor];
    [valiButton addTarget:self action:@selector(codeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [textBgV addSubview:valiButton];
    
    
    self.nextButton = [[UIButton alloc]initWithFrame:CGRectMake(10, textBgV.frame.size.height+textBgV.frame.origin.y+10, SCREEN_WIDTH-20, 50)];
    [self.nextButton setTitle:@"登录/注册" forState:UIControlStateNormal];
    self.nextButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.nextButton.titleLabel.font = [UIFont systemFontOfSize:21];
    self.nextButton.tintColor = [UIColor whiteColor];
//    [self.nextButton setBackgroundImage:[UIImage imageNamed:@"btn-red@2x.png"] forState:UIControlStateNormal];
    self.nextButton.backgroundColor = APP_COLOR;
    self.nextButton.showsTouchWhenHighlighted = YES;
    [self.nextButton addTarget:self action:@selector(nextButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.nextButton];
    
    agreeBtn = [[UIButton alloc]initWithFrame:CGRectMake(10,self.nextButton.frame.size.height+self.nextButton.frame.origin.y+10,20,20)];
    agreeBtn.tag = 1;
    [agreeBtn setImage:[UIImage imageNamed:@"radio2"] forState:UIControlStateNormal];
    [agreeBtn setImage:[UIImage imageNamed:@"radio1"] forState:UIControlStateSelected];
    self.isAgree = agreeBtn.selected;
    
    [agreeBtn addTarget:self action:@selector(agreeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:agreeBtn];
    
    UILabel *agreelab1 = [[UILabel    alloc]initWithFrame:CGRectMake(15+agreeBtn.frame.size.width, 10+self.nextButton.frame.size.height+self.nextButton.frame.origin.y, 100, 20)];
    agreelab1.text = @"我已查看并同意";
    agreelab1.textColor = LINE9;
    agreelab1.font = [UIFont systemFontOfSize:14.0];
    [self.view addSubview:agreelab1];
    
    UIButton *agreeBtn2 = [[UIButton alloc]initWithFrame:CGRectMake(25+agreelab1.frame.size.width,10+self.nextButton.frame.size.height+self.nextButton.frame.origin.y,120,20)];
    agreeBtn2.backgroundColor = [UIColor clearColor];
    
    [agreeBtn2 setTitle:@"《搭伴用户协议》" forState:UIControlStateNormal];
    [agreeBtn2 setTitleColor:APP_COLOR forState:UIControlStateNormal];
    agreeBtn2.titleLabel.textAlignment = NSTextAlignmentCenter;
    agreeBtn2.titleLabel.font = [UIFont systemFontOfSize:14.0];
    agreeBtn2.tintColor = APP_COLOR;
    agreeBtn2.tag = 2;
    [agreeBtn2 addTarget:self action:@selector(agreeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:agreeBtn2];
   
    NSArray *logImgs = @[@"pic_login_qq",@"pic_login_weixin",@"pic_login_xinlang"];
    NSArray *logTiels =@[@"QQ登录",@"微信登录",@"微博登录"];
 
    CGFloat tmpW = (SCREEN_WIDTH-54*3-40*2)/2;
    
    for (int i=0 ; i<3; i++) {
        thirdLogBtn = [[UIButton alloc]init];
        thirdLogBtn.frame = CGRectMake(tmpW + i*93 , CGRectGetMaxY(agreeBtn2.frame)+21, 53, 53+14+14);
        thirdLogBtn.backgroundColor = [UIColor clearColor];
        thirdLogBtn.tag = i+100;
        [thirdLogBtn addTarget:self action:@selector(thirdLogClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:thirdLogBtn];
        
        UIImageView *thirdIV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 53, 53)];
        thirdIV.backgroundColor = [UIColor clearColor];
        thirdIV.image = [UIImage imageNamed:logImgs[i]];
        [thirdLogBtn addSubview:thirdIV];
        
        UILabel *thirdLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 53+14, 53, 14)];
        thirdLab.backgroundColor = [UIColor clearColor];
        thirdLab.text = logTiels[i];
        thirdLab.textAlignment = NSTextAlignmentCenter;
        thirdLab.textColor = ZICOLOR;
        thirdLab.font = [UIFont systemFontOfSize:13.0];
        [thirdLogBtn addSubview:thirdLab];
        
    }
}
#pragma -mark thirdLog

-(void)thirdLogClick:(UIButton *)sender{
    //100：qq  101:微信 102:微博
    
    NSString *str;
    if (sender.tag == 100) {
        str = UMShareToQQ;
    }else if (sender.tag == 101){
        str = UMShareToWechatSession;
    }else{
        str = UMShareToSina;
    }
    
    
    UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:str];
    
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
        
        if (response.responseCode == UMSResponseCodeSuccess) {
            
            UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:str];
            
            NSLog(@"获取用户信息成功:username: %@,uid: %@,token: %@,url: %@",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL);
            
//            [[UMSocialDataService defaultDataService] requestSnsInformation:UMShareToWechatSession  completion:^(UMSocialResponseEntity *response){
//                NSLog(@"SnsInformation is %@",response.data);
//            }];
            
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"USERLogin"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"USERID"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"mobilephone1"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userName1"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"mobile"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"codeIamge1"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"icon2"];
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"userType"];
            
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            //把头像与名字保证起来
            [[NSUserDefaults standardUserDefaults]setObject:snsAccount.userName forKey:@"userName1"];
            [[NSUserDefaults standardUserDefaults]setObject:snsAccount.iconURL  forKey:@"icon2"];
            
            [[NSUserDefaults standardUserDefaults]setObject:snsAccount.usid  forKey:@"USERID"];
            
            //手机登录是1 其它登录是2
            [[NSUserDefaults standardUserDefaults] setInteger:2 forKey:@"LONGTYEP"];
            
            [[NSUserDefaults standardUserDefaults] synchronize];

            [self blackPopViewController];
            
        }});

}


-(void)blackAction:(UIButton *)sender{
    [self blackPopViewController];
}

-(void)blackPopViewController{
    if (self.type == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        for (UIViewController *controller in self.navigationController.viewControllers) {
            if ([controller isKindOfClass:[MSMyViewController class]]) {
                [self.navigationController popToViewController:controller animated:YES];
            }
        }
        
    }

}

-(void)codeBtnAction:(UIButton *)sender{

    BOOL isPhone = [self isValidateMobile:telTextField.text];
    if (telTextField.text.length == 0) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"手机号码不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else if(isPhone == 0 )
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"手机号码格式错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }else{
        
        flags = 1;
        timeTick = 60;
    
        _timer  = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(valiClick) userInfo:nil repeats:YES];
        [self request];
    }
}


- (void)valiClick
{
    if (flags == 1)
    {
//        timeTick = 60;
        timeTick--;
        NSString *timeString = [[NSString alloc] initWithFormat:@"重新获取(%d)", timeTick];
        [valiButton setTitle:timeString forState:UIControlStateNormal];
    }
    
    NSString *timeString = [[NSString alloc] initWithFormat:@"重新获取(%d)", timeTick];
//    NSLog(@"timeString---%@",timeString);
    //    valiButton.titleLabel.text = timeString;
    [valiButton setTitle:timeString forState:UIControlStateNormal];
    [valiButton setBackgroundImage:[UIImage imageNamed:@"btn-gray.png"] forState:UIControlStateNormal];
//    valiButton.frame = CGRectMake(200, 70, 105, 30);
    [valiButton removeTarget:self action:@selector(codeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    if (timeTick == 0) {
        [valiButton setTitle:@"重新发送" forState:UIControlStateNormal];
        [valiButton setBackgroundImage:[UIImage imageNamed:@"btn-bule.png"] forState:UIControlStateNormal];
        [_timer invalidate];
        [valiButton addTarget:self action:@selector(codeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
}



-(void)nextButtonAction:(UIButton *)sender{
    UITextField *textField1 = (UITextField *)[self.view viewWithTag:10];
    UITextField *textField2 = (UITextField *)[self.view viewWithTag:11];
    
    BOOL istelePhone = [self isValidateMobile:textField1.text];
  
    
    if (self.isAgree == YES) {
        [self showMyMessage:@"请勾选用户协议"];
    }
    else  if (textField1.text.length == 0 || textField2.text.length == 0 ) {
        [self showMyMessage:@"输入手机或密码不能为空"];
    }
    else if(istelePhone == NO)
    {
        [self showMyMessage:@"手机号码格式不正确"];
    }
    else if(codeTextField.text.length != 4)
    {
        [self showMyMessage:@"验证码不正确"];
    }else{
    
        [self loginRequest];
    }
}

-(void)agreeBtnAction:(UIButton *)sender{
    
    sender.selected = !sender.selected;
    self.isAgree = sender.selected;
}

-(void)request{

    [WTRequestCenter postWithURL:[NSString stringWithFormat:@"%@smscode?phone=%@",DaBan_URL,telTextField.text] parameters:nil finished:^(NSURLResponse *response, NSData *data)
     
     {
         
         if (data) {
             NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
             NSLog(@"result---%@",result);
        
         }
         
     } failed:^(NSURLResponse *response, NSError *error) {
       
         
         if (error) {
             NSString *errorDescription = [error.userInfo objectForKey:@"NSLocalizedDescription"];
             if (errorDescription) {
                 //请求超时。
                 if ([errorDescription isEqualToString:@"The request timed out."])
                 {
                     [self showMyMessage:@"请求超时，请稍后重试"];
                 }
             }
             return;
         }
         
     }];
    
}


-(void)loginRequest
{
    [WTRequestCenter postWithURL:[NSString stringWithFormat:@"%@login?phone=%@&smscode=%@",DaBan_URL,telTextField.text,codeTextField.text] parameters:nil finished:^(NSURLResponse *response, NSData *data)
     
     {
         
         if (data) {

             id result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];

             NSLog(@"result---%@--%d",result,[[result objectForKey:@"retcode"]intValue]);

             if ([result isKindOfClass:[NSDictionary class]])
             {
                 
                 if ([[result objectForKey:@"retcode"]intValue] != 0) {
                     [self showMyMessage:@" 验证码不正确！"];
                 }else{
                     
                      NSString *flag = [[NSUserDefaults standardUserDefaults] objectForKey:@"FirstLoad"];
                     [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"USERLogin"];
                     [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"USERID"];
                     [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"session_token"];
                     [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"mobilephone1"];
                     
                     NSString *tem = result[@"data"];
                     NSData* myData=[tem dataUsingEncoding:NSUTF8StringEncoding];
                     
                     id dictionary2 = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingAllowFragments error:nil];
                     NSLog(@"dic2:-%@",dictionary2);
                     
                     NSNumber *state = [dictionary2 valueForKey:@"result"];
                     int userState = [state intValue];
                     NSNumber *uid = [dictionary2 valueForKey:@"uid"];
                     int userUid = [uid intValue];
                     NSString *session_token = dictionary2[@"session_token"];
                
                     
                     //1（已注册用户登录）     2（新用户注册）
            
                     if ([flag isEqualToString:@"YES"])
                     {
                         [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"FirstLoad"];
                     }
                
                     [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d",userState] forKey:@"USERLogin"];
                     [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d",userUid] forKey:@"USERID"];
                     [[NSUserDefaults standardUserDefaults] setObject:session_token forKey:@"session_token"];
                     NSLog(@"token1 = %@",session_token);
                     [[NSUserDefaults standardUserDefaults] setObject:telTextField.text forKey:@"mobilephone1"];
                     //手机登录是1 其它登录是2
                     [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"LONGTYEP"];
                     [[NSUserDefaults standardUserDefaults] synchronize];
                     
                     MSMyViewController *my = [[MSMyViewController alloc]init];
                     my.navigationItem.hidesBackButton = YES;

                     [self blackPopViewController];
                 }
             }
         }
         
     } failed:^(NSURLResponse *response, NSError *error) {
         
         
         if (error) {
             NSString *errorDescription = [error.userInfo objectForKey:@"NSLocalizedDescription"];
             if (errorDescription) {
                 //请求超时。
                 if ([errorDescription isEqualToString:@"The request timed out."])
                 {
                     [self showMyMessage:@"请求超时，请稍后重试"];
                 }
             }
             return;
         }
         
     }];

}


#pragma mark
#pragma mark -- 密码验证
- (BOOL) validatePassword:(NSString *)passWord
{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{4,15}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}

// 判断电话号码是否正确
- (BOOL)isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(17[0-9])|(15[^4,\\D])|(18[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

    
    [telTextField resignFirstResponder];
    [codeTextField resignFirstResponder];
    
    

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
 
    
    [telTextField resignFirstResponder];
    [codeTextField resignFirstResponder];
   
    
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSCharacterSet *cs;
    if(textField == telTextField || textField == codeTextField)
    {
        cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        BOOL basicTest = [string isEqualToString:filtered];
        if(!basicTest)
        {
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:@"请输入数字"
                                                           delegate:nil
                                                  cancelButtonTitle:@"确定"
                                                  otherButtonTitles:nil];
            
            [alert show];
            
            return NO;
        }
    }

    return YES;
}

- (void)navigationLiftButonWasClick:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
