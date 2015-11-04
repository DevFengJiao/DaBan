//
//  MSIdentityViewController.m
//  DaBan
//
//  Created by qkm on 15-8-24.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSIdentityViewController.h"
#import "MSIdentityView.h"
#import "MSWalletModel.h"

@interface MSIdentityViewController ()
{
    MSIdentityView  *identityView;
    MSWalletModel   *model;
}
@end

@implementation MSIdentityViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"身份认证";
    
//    model = [[MSWalletModel alloc]init];
//    model.name = @"王二狗";
//    model.number = @"1231412421";
//    model.identfImg = @"iden.png";
    
    identityView = [[MSIdentityView alloc]init];
//    identityView.model = model;
    identityView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    [identityView.nextButton addTarget:self action:@selector(nextButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [identityView.btnPhoto addTarget:self action:@selector(btnPhotoClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:identityView];
    
}

-(void)nextButtonClick{
    NSLog(@"%@--%@",identityView.numberTextField.text,identityView.nameTextField.text);
    if (NULL_STR(identityView.nameTextField.text)) {
        [self showMyMessage:@"您填写的姓名不正确"];
    }else if (identityView.numberTextField.text.length !=18){
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"身份证号码格式错误" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }else{
        [self request];
    }
}

-(void)btnPhotoClick{
    [self PhotoImage];
}

-(void)request{
    
    NSURL *url4 = [NSURL URLWithString:[NSString stringWithFormat:@"%@verify/id?token=%@&real_name=%@&num_id_license=%@&imgurl_id_license=%@",DaBan_URL,[self url],identityView.nameTextField.text,identityView.numberTextField.text,@"self.png"]];
    
    
    
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
            [self showMyMessage:@"我们将在最快的时间为您审核，请耐心等待"];
            [[NSNotificationCenter defaultCenter] postNotificationName:@"identity" object:@"YES"];
            [self.navigationController popViewControllerAnimated:YES];
        }
        NSLog(@"Test: %@",response);
    }

    
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
        
    [identityView.btnPhoto setBackgroundImage:[UIImage imageWithContentsOfFile:imageFilePath] forState:UIControlStateNormal];

}

-(void)no{
    NSLog(@"ononono");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
