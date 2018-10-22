//
//  AppealViewController.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/18.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "AppealViewController.h"
#import "AppealView.h"
#import <AVFoundation/AVFoundation.h>//相机调用

@interface AppealViewController  ()<UITextViewDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate>
@property (nonatomic,strong)AppealView *userView;
@property (nonatomic, strong) NSData * imageData;
@property (nonatomic, assign)NSInteger ButtonTwoTag;//区别选择图片tag

@end

@implementation AppealViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"用户反馈";
    self.userView = [[AppealView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.view = self.userView;
    self.userView.adviceTextView.tag = 1001;
    self.userView.adviceTextView.delegate = self;
    
    self.view.backgroundColor = [UIColor whiteColor];//消除跳转界面问题
    
    self.userView.addImage1.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
    [self.userView.addImage1 addGestureRecognizer:tapGesture];
    
    self.userView.addImage2.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap2Gesture= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap2Action)];
    [self.userView.addImage2 addGestureRecognizer:tap2Gesture];
    
    self.userView.addImage3.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap3Gesture= [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap3Action)];
    [self.userView.addImage3 addGestureRecognizer:tap3Gesture];
    
    
    //申诉原因点击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(creatAppealResonSheet)];
    self.userView.resonView.userInteractionEnabled = YES;
    [self.userView.resonView addGestureRecognizer:tap];
    
    
    
}
#pragma mark 图片点击事件
-(void)tapAction
{
    [self creatActionSheet:1];
}
-(void)tap2Action
{
    [self creatActionSheet:2];
}
-(void)tap3Action
{
    [self creatActionSheet:3];
}
#pragma mark  textview  代理
- (void)textViewDidChange:(UITextView *)textView
{
    if (textView.tag == 1001) {
        self.userView.placeholderLab.hidden = YES;
        self.userView.stirngLenghLabel.text = [NSString stringWithFormat:@"%lu/1000", (unsigned long)textView.text.length];
        //字数限制操作
        if (textView.text.length >= 1000)
        {
            textView.text = [textView.text substringToIndex:100];
            self.userView.stirngLenghLabel.text = @"1000/1000";
            textView.text = [textView.text substringToIndex:1000];
        }
    }

}
#pragma mark 创建底部弹框
-(void)creatActionSheet:(NSInteger)itg {
    /*
     先创建UIAlertController，preferredStyle：选择UIAlertControllerStyleActionSheet，这个就是相当于创建8.0版本之前的UIActionSheet；
     
     typedef NS_ENUM(NSInteger, UIAlertControllerStyle) {
     UIAlertControllerStyleActionSheet = 0,
     UIAlertControllerStyleAlert
     } NS_ENUM_AVAILABLE_IOS(8_0);
     */
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    /*
     typedef NS_ENUM(NSInteger, UIAlertActionStyle) {
     UIAlertActionStyleDefault = 0,
     UIAlertActionStyleCancel,         取消按钮
     UIAlertActionStyleDestructive     破坏性按钮，比如：“删除”，字体颜色是红色的
     } NS_ENUM_AVAILABLE_IOS(8_0);
     
     */
    // 创建action，这里action1只是方便编写，以后再编程的过程中还是以命名规范为主
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //相机
        NSString *mediaType = AVMediaTypeVideo;
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
        if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"无法使用相机" message:@"请在iPhone的\"设置-隐私-相机\"中允许访问相机" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];
            return;
        }
        
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:imagePickerController animated:YES completion:^{
            _ButtonTwoTag = itg;
            
            
        }];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"从相册中选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //相册
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
        imagePickerController.delegate = self;
        imagePickerController.allowsEditing = YES;
        imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:imagePickerController animated:YES completion:^{
            
            _ButtonTwoTag = itg;
        }];
    }];
    
    UIAlertAction *action4 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    [action1 setValue:RGB(10, 31, 55, 1) forKey:@"titleTextColor"];
    [action2 setValue:RGB(10, 31, 55, 1) forKey:@"titleTextColor"];
    [action4 setValue:RGB(4, 197, 252, 1) forKey:@"titleTextColor"];
    //把action添加到actionSheet里
    [actionSheet addAction:action1];
    [actionSheet addAction:action2];
    [actionSheet addAction:action4];
    
    //相当于之前的[actionSheet show];
    [self presentViewController:actionSheet animated:YES completion:nil];
}
#pragma mark - 调用uiactionsheet iOS7使用
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    NSInteger soureType = 0;
    //是否支持相机，模拟器没有相机
    switch (buttonIndex) {
        case 1://相册
            soureType = UIImagePickerControllerSourceTypePhotoLibrary;
            break;
        default:
            break;
    }
    if (buttonIndex == 1) {
        soureType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    }
    //跳转到相机或相册页面
    UIImagePickerController *imagePick = [[UIImagePickerController alloc]init];
    imagePick.delegate = self;
    imagePick.allowsEditing = YES;
    imagePick.sourceType = soureType;
    [self presentViewController:imagePick animated:YES completion:nil];
}

#pragma mark - iOS7 iOS8 都要调用方法，拉取取消按钮调用该方法
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - 保存图片到沙盒中
-(void)saveImage:(UIImage *)currentImage withName:(NSString *)imageName{
    NSData *imageData = UIImageJPEGRepresentation(currentImage, 1); //返回的数据大小(1~0.0)
    //获取沙盒目录
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]stringByAppendingPathComponent:imageName];
    
    //将图片写入文件
    [imageData writeToFile:fullPath atomically:NO];
}

#pragma mark -  压缩图片
- (UIImage *)imageWithImageSimple:(UIImage*)image scaledToSize:(CGSize)newSize{
    // Create a graphics image context
    UIGraphicsBeginImageContext(newSize);
    // Tell the old image to draw in this new context, with the desired
    // new size
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    // Get the new image from the context
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    // End the context
    UIGraphicsEndImageContext();
    // Return the new image.
    return newImage;
}

#pragma mark  裁剪图片
- (UIImage *)cutImage:(UIImage*)image withSize:(CGSize)size
{
    //压缩图片
    CGSize newSize;
    CGImageRef imageRef = nil;
    
    if ((image.size.width / image.size.height) < (size.width / size.height)) {
        newSize.width = image.size.width;
        newSize.height = image.size.width * size.height / size.width;
        
        imageRef = CGImageCreateWithImageInRect([image CGImage], CGRectMake(0, fabs(image.size.height - newSize.height) / 2, newSize.width, newSize.height));
        
    } else {
        newSize.height = image.size.height;
        newSize.width = image.size.height * size.width /size.height;
        
        imageRef = CGImageCreateWithImageInRect([image CGImage], CGRectMake(fabs(image.size.width - newSize.width) / 2, 0, newSize.width, newSize.height));
        
    }
    return [UIImage imageWithCGImage:imageRef];
}

#pragma mark - iOS7 iOS8 都要调用方法，选择完成调用该方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    //保存图片到本地，上传图片到服务器需要使用
    [self saveImage:[self imageWithImageSimple:image scaledToSize:CGSizeMake(70, 70)] withName:@"avatar.jpeg"];
    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]stringByAppendingPathComponent:@"avatar.jpeg"];
    
    //存储路径
    NSLog(@"!!!!!!!!!!!!!!!!!!!!!!!!!!存储路径%@", fullPath);
    UIImage *saveImage = [[UIImage alloc]initWithContentsOfFile:fullPath];
    
    //1 //UIImage转换为NSData
    self.imageData = UIImageJPEGRepresentation(saveImage, 0.5);
    NSString *imageStr = [self.imageData base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    if (_ButtonTwoTag == 1) {
        self.userView.addImage1.image = saveImage;
        self.userView.addImage2.hidden = NO;
    }
    else if(_ButtonTwoTag == 2) {
        self.userView.addImage2.image = saveImage;
        self.userView.addImage3.hidden = NO;
        
    }
    else
    {
        self.userView.addImage3.image = saveImage;
        
    }
    
    
    
    NSDictionary *dic = @{
                          @"base64":[NSString stringWithFormat:@"%@%@",@"data:image/jpeg;base64,",imageStr]
                          };
    //上传
    
}
#pragma 申诉原因展示
-(void)creatAppealResonSheet {
    /*
     先创建UIAlertController，preferredStyle：选择UIAlertControllerStyleActionSheet，这个就是相当于创建8.0版本之前的UIActionSheet；
     
     typedef NS_ENUM(NSInteger, UIAlertControllerStyle) {
     UIAlertControllerStyleActionSheet = 0,
     UIAlertControllerStyleAlert
     } NS_ENUM_AVAILABLE_IOS(8_0);
     */
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    /*
     typedef NS_ENUM(NSInteger, UIAlertActionStyle) {
     UIAlertActionStyleDefault = 0,
     UIAlertActionStyleCancel,         取消按钮
     UIAlertActionStyleDestructive     破坏性按钮，比如：“删除”，字体颜色是红色的
     } NS_ENUM_AVAILABLE_IOS(8_0);
     
     */
    // 创建action，这里action1只是方便编写，以后再编程的过程中还是以命名规范为主
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"对方未付款" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        self.userView.resonShowLab.text = @"对方未付款";
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"对方未放行" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"选择了B类" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        //        [alertView show];
        self.userView.resonShowLab.text = @"对方未放行";

    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"对方无应答" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.userView.resonShowLab.text = @"对方无应答";

    }];
    UIAlertAction *action4 = [UIAlertAction actionWithTitle:@"对方有欺诈行为" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.userView.resonShowLab.text = @"对方有欺诈行为";

        //        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"选择了B类" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        //        [alertView show];
    }];
    UIAlertAction *action5 = [UIAlertAction actionWithTitle:@"其他" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.userView.resonShowLab.text = @"其他";

    }];
    UIAlertAction *action6 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    [action1 setValue:RGB(10, 31, 55, 1) forKey:@"titleTextColor"];
    [action2 setValue:RGB(10, 31, 55, 1) forKey:@"titleTextColor"];
    [action3 setValue:RGB(10, 31, 55, 1) forKey:@"titleTextColor"];
    [action4 setValue:RGB(10, 31, 55, 1) forKey:@"titleTextColor"];
    [action5 setValue:RGB(10, 31, 55, 1) forKey:@"titleTextColor"];
    [action6 setValue:RGB(10, 31, 55, 1) forKey:@"titleTextColor"];

    //把action添加到actionSheet里
    [actionSheet addAction:action1];
    [actionSheet addAction:action2];
    [actionSheet addAction:action3];
    [actionSheet addAction:action4];
    [actionSheet addAction:action5];
    [actionSheet addAction:action6];

    
    //相当于之前的[actionSheet show];
    [self presentViewController:actionSheet animated:YES completion:nil];
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
