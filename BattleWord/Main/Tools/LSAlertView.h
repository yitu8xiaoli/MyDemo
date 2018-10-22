//
//  LSAlertView.h
//  BojiaInvest
//
//  Created by 李帅 on 2017/12/25.
//  Copyright © 2017年 李帅. All rights reserved.
//

#import <UIKit/UIKit.h>

//确定按钮点击事件
typedef void(^sureBlock)(void);
typedef void(^resendBlock)(void);

@interface LSAlertView : UIView

@property(nonatomic,copy)sureBlock sure_block;
@property(nonatomic,copy)resendBlock resend_block;
@property(nonatomic,retain)UIButton *resendBtn;
@property(nonatomic,retain)UITextField *cardText;

-(void)setBtnTitle:(NSString *)title;

+(instancetype)alterViewWithTitle:(NSString *)title
                          content:(NSString *)content
                             sure:(NSString *)sure
                    resendBtClcik:(sureBlock)resendBlock
                      sureBtClcik:(sureBlock)sureBlock;

@end
