//
//  HomePageViewController.m
//  ProjectFramework
//
//  Created by 李帅 on 2018/8/9.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "HomePageViewController.h"
#import "LSUIFactory.h"
#import "UILabel+LSLabel.h"

@interface HomePageViewController ()
@property (nonatomic,strong)UILabel_LSLabel *textLab;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGB(6, 19, 51, 1);
    self.textLab  = [LSUIFactory createLabelWithFrame:CGRectMake(100, 300, 200, 100) FontSize:15 Text:@"这是一个测试,加息10%,这真是太棒了"textColor:[UIColor whiteColor] NSTextAlignment:NSTextAlignmentLeft];
    [self.textLab setFontWithFirstColor:[UIColor redColor] FirstFontSize:12 SecondColor:[UIColor yellowColor] SecondFontSize:22 locationTag:8];
    [self.textLab LabelClick:self action:@selector(ladianji)];
    [self.view addSubview:self.textLab];
    
    
    self.title = @"社区";

    
    
    
}
-(void)ladianji
{
//    AVObject *testObject = [AVObject objectWithClassName:@"Share"];
//    [testObject setObject:@"1" forKey:@"showStr"];
//    [testObject save];

    //测试Leancloud  取数据
    AVQuery *query = [AVQuery queryWithClassName:@"Share"];
    [query getObjectInBackgroundWithId:@"5b8cd174d50eee0039370335" block:^(AVObject *object, NSError *error) {
        // object 就是 id 为 56f8aab879bc44005920635e 的 Todo 对象实例
        NSString *location = [object objectForKey:@"showStr"];
        NSLog(@"%@",location);
    }];
        
        
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
