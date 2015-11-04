//
//  MSUserViewController.h
//  DaBan
//
//  Created by qkm on 15-8-3.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSBeseViewController.h"
#import "MSHeadView.h"
#import "UIPopoverListView.h"
#import "EGOImageView.h"
#import "uploadImage.h"


@interface MSUserViewController : MSBeseViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UITableView     *_mainTableView;

    UITextField     *_nameTextField;
    UITextField     *_ageTextField;
    UITextField     *_professionTextField;
    UILabel         *_sexLabel2;

    UIView          *backView_1;
    UIView          *bgV;
   
    UIView          *sexBackView;
    UIView          *sexBgv;
    
    UIImagePickerController *imagePicker;
    NSString        *imageFilePath;
    UIImageView     *img;
    NSData          *fileData;
    

}

@property (nonatomic, strong)MSHeadView *headView;
@property (nonatomic, strong)UIBarButtonItem *editButton;
@property (nonatomic, strong)NSURL *url;
@property (nonatomic, strong)NSString *rolelab; //判断是不是车主
@end
