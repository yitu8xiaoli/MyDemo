//
//  MyWebViewController.m
//  BojiaInvest
//
//  Created by 李帅 on 2018/9/10.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "MyWebViewController.h"

@interface MyWebViewController ()<UIWebViewDelegate>
@property (nonatomic,strong)UIWebView *myWebXYView;
@property (nonatomic,strong)UILabel *titleLabel;

@end

@implementation MyWebViewController
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{//111
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0, 200, 44)];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    self.titleLabel.text = self.tit;
    self.titleLabel.textColor = [UIColor blackColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = self.titleLabel;//
    
    
    UIWebView* webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    webView.delegate = self;
    webView.scalesPageToFit = YES;//自动对页面进行缩放以适应屏幕
    //    webView.detectsPhoneNumbers = YES;//自动检测网页上的电话号码，单击可以拨打
    [self.view addSubview:webView];
    NSString *myurl = self.url;
    NSString * urlStr = [myurl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL* url = [NSURL URLWithString:urlStr];//创建URL
    NSURLRequest* request = [NSURLRequest requestWithURL:url];//创建NSURLRequest
    [webView loadRequest:request];//加载
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
