//
//  MSAboutViewController.m
//  DaBan
//
//  Created by qkm on 15-9-14.
//  Copyright (c) 2015年 QKM. All rights reserved.
//

#import "MSAboutViewController.h"
#import "MSAboutView.h"

@interface MSAboutViewController ()<MSAboutViewDelegate>
@property (nonatomic,strong) MSAboutView   *aboutView;
@end

@implementation MSAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于我们";
    self.aboutView = [[MSAboutView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-62)];
    self.aboutView.delegate = self;
 
    [self.view addSubview:self.aboutView];
    
}

-(void)msAboutViewDelegate:(NSInteger)tag{

    NSString *strPhone =@"075526037731";
    if ([CTSIMSupportGetSIMStatus() isEqualToString:kCTSIMSupportSIMStatusNotInserted]){
        UIAlertView *allerView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"未插入sim卡" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
        [allerView show];
        
    } else{
        if (tag ==1) {
            strPhone = @"4000009919";
        }
        NSString *telUrl = [NSString stringWithFormat:@"tel:%@",strPhone];
        NSURL *url = [[NSURL alloc] initWithString:telUrl];
        [[UIApplication sharedApplication] openURL:url];
        NSLog(@"str:  %@",strPhone);
    }

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
