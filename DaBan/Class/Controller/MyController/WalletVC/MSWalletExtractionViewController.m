//
//  MSWalletExtractionViewController.m
//  DaBan
//
//  Created by qkm on 15-8-19.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSWalletExtractionViewController.h"
#import "MSTopView.h"
#import "MSWalletModel.h"
#import "MSIdentityViewController.h"

@interface MSWalletExtractionViewController ()<UITextFieldDelegate>
{
    MSTopView   *topView;
    UIButton    *agreeBtn;
    UIButton    *agreeBtn2;
    UITextField *nameTextField;
    UITextField *numberTextField;
}
@property (nonatomic, strong)  MSWalletModel *model;
@property (nonatomic, strong) UIButton  *nextButton;
@property (nonatomic, assign) BOOL isAgree;
@property (nonatomic, assign)  NSInteger     identityType;//0 未认证 1提交了认证 2已认证
@end

@implementation MSWalletExtractionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"余额提现";
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(Identity) name:@"identity" object:nil];
    
    [self requset];
    
    _model = [[MSWalletModel alloc]init];
    double tempWallet = 1000.54;
    _model.wallet =  [NSString stringWithFormat:@"%.2f",tempWallet];
 

    topView = [[MSTopView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    topView.model = _model;
    
    [self.view addSubview:topView];
    
    [self drawView];
    
}

-(void)Identity{
    self.identityType = 1;

    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"identity" object:nil];
    
}

-(void)drawView{
    
    UIButton *topLab = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 24)];
    topLab.backgroundColor = BACK_GRAY_COLOR20;
    topLab.titleLabel.textColor = [UIColor whiteColor];
    topLab.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [topLab setTitle:@"身份认证之后才能提现哟" forState:UIControlStateNormal];
    [topLab addTarget:self action:@selector(topClick) forControlEvents:UIControlEventTouchUpInside];
    if (self.identityType == 0) {
        [self.view addSubview:topLab];
    }
    
    UIView *bgV = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(topView.frame)+10, SCREEN_WIDTH, 75+68.5)];
    bgV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgV];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 20)];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = ZICOLOR;
    label.font = [UIFont systemFontOfSize:16.0];
    label.text = @"提现账号";
    [bgV addSubview:label];
    
    
    agreeBtn = [[UIButton alloc]initWithFrame:CGRectMake(50,CGRectGetMaxY(label.frame)+10,20,20)];
    agreeBtn.tag = 1;
    [agreeBtn setImage:[UIImage imageNamed:@"radio2"] forState:UIControlStateNormal];
    
    self.isAgree = agreeBtn.selected;
    
    [agreeBtn addTarget:self action:@selector(agreeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [bgV addSubview:agreeBtn];
    
    UILabel *zifuLab = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(agreeBtn.frame)+10, CGRectGetMaxY(label.frame)+10, 60, 20)];
    zifuLab.backgroundColor = [UIColor clearColor];
    zifuLab.text = @"支付宝";
    zifuLab.textColor = ZICOLOR;
    zifuLab.font = [UIFont systemFontOfSize:14];
    [bgV addSubview:zifuLab];
    
    
    agreeBtn2 = [[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2+50,CGRectGetMaxY(label.frame)+10,20,20)];
    agreeBtn2.tag = 2;
    [agreeBtn2 setImage:[UIImage imageNamed:@"radio1"] forState:UIControlStateNormal];
    [agreeBtn2 addTarget:self action:@selector(agreeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [bgV addSubview:agreeBtn2];
    
    UILabel *zifuLab2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(agreeBtn2.frame)+10, CGRectGetMaxY(label.frame)+10, 60, 20)];
    zifuLab2.backgroundColor = [UIColor clearColor];
    zifuLab2.text = @"微信钱包";
    zifuLab2.textColor = ZICOLOR;
    zifuLab2.font = [UIFont systemFontOfSize:14];
    [bgV addSubview:zifuLab2];

    
    UILabel *lineLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 74.5, SCREEN_WIDTH, 0.5)];
    lineLab.backgroundColor = LINEC;
    [bgV addSubview:lineLab];
    
    UILabel *nameLab = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(lineLab.frame)+10, 40, 20)];
    nameLab.backgroundColor = [UIColor clearColor];
    nameLab.text = @"姓名";
    nameLab.textColor = ZICOLOR;
    nameLab.font = ZIFOUT14;
    [bgV addSubview:nameLab];
    
    nameTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(nameLab.frame), CGRectGetMaxY(lineLab.frame)+10,SCREEN_WIDTH-60, 20)];
    nameTextField.delegate = self;
    nameTextField.backgroundColor = [UIColor clearColor];
    nameTextField.placeholder = @"请输入姓名";
//    nameTextField.text = @"史苦瓜";
    nameTextField.textColor = ZICOLOR;
    nameTextField.font = ZIFOUT14;
    [bgV addSubview:nameTextField];

    
    UILabel *numberLab = [[UILabel alloc]initWithFrame:CGRectMake(10,CGRectGetMaxY(nameLab.frame)+10, 40, 20)];
    numberLab.backgroundColor = [UIColor clearColor];
    numberLab.text = @"账号";
    numberLab.textColor = ZICOLOR;
    numberLab.font = ZIFOUT14;
    [bgV addSubview:numberLab];
    
    numberTextField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(numberLab.frame),CGRectGetMaxY(nameLab.frame)+10,SCREEN_WIDTH-60, 20)];
    numberTextField.delegate = self;
    numberTextField.backgroundColor = [UIColor clearColor];
    numberTextField.placeholder = @"请输入账号";
//    numberTextField.text = @"12345@qq.com";
    numberTextField.textColor = ZICOLOR;
    numberTextField.font = ZIFOUT14;
    numberTextField.keyboardType = UIKeyboardTypeNamePhonePad;
    [bgV addSubview:numberTextField];
    
    bgV.frame = CGRectMake(bgV.frame.origin.x, bgV.frame.origin.y, bgV.frame.size.width, CGRectGetMaxY(numberTextField.frame)+10);
    
    UILabel *zicontenlab = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(bgV.frame)+10,SCREEN_WIDTH-20, 14)];
    zicontenlab.backgroundColor = [UIColor clearColor];
    zicontenlab.font = ZIFOUT14;
    zicontenlab.text = @"提现须知";
    zicontenlab.textColor = ZICOLOR;
    [self.view addSubview:zicontenlab];
    
    UILabel *contenLab = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(zicontenlab.frame)+4, SCREEN_WIDTH-20, 100)];
    contenLab.backgroundColor = [UIColor clearColor];
    contenLab.numberOfLines = 0;
    contenLab.font = [UIFont systemFontOfSize:12.0];
    contenLab.text = @" 1.仅支持支付宝提现。\n 2.认证车主必须使用与驾驶证上姓名相同的银行卡或者支付宝账账户来提现。\n 3.提现金额和提现时间说明如下：\n 4.提现申请成功后，我们将尽快审核并支付，预计3个工作日到账。\n 5.如果您提交的帐号有误，提现款项将退回“拼搭钱包”，请您检查后重新申请提现。\n 6.外籍人士、特殊账户、实名用户信息错误等问题请您联系客服处理 400-xxx-xxxx。";
    CGSize size = [contenLab sizeThatFits:CGSizeMake(contenLab.frame.size.width, MAXFLOAT)];
    contenLab.frame = CGRectMake(contenLab.frame.origin.x, contenLab.frame.origin.y, contenLab.frame.size.width, size.height);
    contenLab.textColor = ZICOLOR;
    [self.view addSubview:contenLab];
    
    self.nextButton = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-53-64, SCREEN_WIDTH, 53)];
    [self.nextButton setTitle:@"全额提现" forState:UIControlStateNormal];
    self.nextButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.nextButton.titleLabel.font = [UIFont systemFontOfSize:21];
    self.nextButton.tintColor = [UIColor whiteColor];
    self.nextButton.backgroundColor = APP_COLOR;
    self.nextButton.showsTouchWhenHighlighted = YES;
    [self.nextButton addTarget:self action:@selector(nextButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.nextButton];
    
    
}

-(void)agreeBtnAction:(UIButton *)sender{
    
    if (sender.tag == 1) {
        [agreeBtn2 setImage:[UIImage imageNamed:@"radio1"] forState:UIControlStateNormal];
        [agreeBtn setImage:[UIImage imageNamed:@"radio2"] forState:UIControlStateNormal];
    }else{
         [agreeBtn setImage:[UIImage imageNamed:@"radio1"] forState:UIControlStateNormal];
         [agreeBtn2 setImage:[UIImage imageNamed:@"radio2"] forState:UIControlStateNormal];
    }
//    sender.selected = !sender.selected;
//    self.isAgree = sender.selected;
}

-(void)nextButtonAction:(UIButton *)sender{
   
    if (self.identityType == 0) {
        MSIdentityViewController *identity = [[MSIdentityViewController alloc]init];
        [self.navigationController pushViewController:identity animated:YES];
    }else{
        UIAlertView  *alert = [[UIAlertView alloc] initWithTitle:nil message:@"申请提交成功,预计将于3个工作日之内到账" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确实", nil];
        [alert show];
    }
}
//顶部的按钮点击事件
-(void)topClick{
    MSIdentityViewController *identity = [[MSIdentityViewController alloc]init];
    [self.navigationController pushViewController:identity animated:YES];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        [self.navigationController  popViewControllerAnimated:YES];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [nameTextField resignFirstResponder];
    [numberTextField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [nameTextField resignFirstResponder];
    [numberTextField resignFirstResponder];
    return YES;
}


-(void)requset{
    NSString *url = [[NSUserDefaults standardUserDefaults] objectForKey:@"session_token"];
    
    NSString *url1 = [url stringByReplacingOccurrencesOfString:@"+" withString:@"%2b"];
    
    NSString *url2 = [url1 stringByReplacingOccurrencesOfString:@"/" withString:@"%2f"];
    
    NSString *url3 = [url2 stringByReplacingOccurrencesOfString:@"=" withString:@"%3d"];
    
    NSURL *url4 = [NSURL URLWithString:[NSString stringWithFormat:@"%@wallet_query?token=%@",DaBan_URL,url3]];
    
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url4];
    
    [request addRequestHeader:@"Content-Type" value:@"application/json; encoding=utf-8"];
    
    [request addRequestHeader:@"Accept" value:@"application/json"];
    
    [request setRequestMethod:@"POST"];
    
    [SVProgressHUD dismiss];
    
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
            
            _model = [[MSWalletModel alloc]init];
            _model.ziStr = @"账户余额(元)";
            _model.bgImg = @"bGImg.png";
            
            double tempWallet = [[dictionary2 objectForKey:@"total_money"]doubleValue]/100;
            _model.wallet =  [NSString stringWithFormat:@"%.2f",tempWallet];
            _model.payment = [NSString stringWithFormat:@"已预付款%.2f元",tempWallet];
            NSLog(@"wall--%@",_model.wallet);
        }else {
            
            [self showMyMessage:@"攻城狮一步一步在努力啦!"];
        }
        
        NSLog(@"Text: %@",response);
    }
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
