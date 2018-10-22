//
//  LSAlertView.m
//  BojiaInvest
//
//  Created by 李帅 on 2017/12/25.
//  Copyright © 2017年 李帅. All rights reserved.
//

#import "LSAlertView.h"

@interface  LSAlertView()
@property(nonatomic,retain)UIView *alterView;
@property(nonatomic,retain)UILabel *titleLb;
@property(nonatomic,retain)UILabel *contentLb;


@property(nonatomic,retain)UIButton *sureBt;

@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSString *cancel;
@property(nonatomic,copy)NSString *sure;

@end

@implementation LSAlertView
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        //标题
        
        
        
        _titleLb=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, self.bounds.size.width, 24)];
        _titleLb.textAlignment=NSTextAlignmentCenter;
        _titleLb.textColor= [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:0.6];
        [self addSubview:_titleLb];
        //内容
        _contentLb=[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_titleLb.frame) + 5, self.bounds.size.width, 16.5)];
        _contentLb.textAlignment=NSTextAlignmentCenter;
        _contentLb.font = [UIFont systemFontOfSize:12];
        _contentLb.textColor = RGB(6, 19, 252, 1);
        [self addSubview:_contentLb];
        //
        _cardText = [[UITextField alloc]initWithFrame:CGRectMake(15,maxY(self.contentLb) + 12, self.bounds.size.width - 30, 50)];
        _cardText.placeholder = @"输入验证码";
        _cardText.borderStyle = UITextBorderStyleLine;
        _cardText.layer.borderWidth = 0.5;
        _cardText.layer.borderColor= [UIColor whiteColor].CGColor;
        [self addSubview:_cardText];
       
        UIView *myView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 50)];
        myView.backgroundColor = [UIColor clearColor];
        _cardText.leftViewMode = UITextFieldViewModeAlways;
        _cardText.leftView = myView;
        
        //确定按钮
        _sureBt=[[UIButton alloc]initWithFrame:CGRectMake(15,CGRectGetMaxY(_cardText.frame) + 15.5, self.bounds.size.width - 30, 50)];
        _sureBt.backgroundColor = [UIColor colorWithRed:242/255.0 green:167/255.0 blue:72/255.0 alpha:1.0];
        _sureBt.layer.cornerRadius = 10;
        [_sureBt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_sureBt addTarget:self action:@selector(sureBtClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_sureBt];
        
        //
        _resendBtn = [[UIButton alloc]initWithFrame:CGRectMake(maxX(_cardText) -100,minY(_cardText), 85, 50)];
        _resendBtn.backgroundColor = [UIColor clearColor];
        [_resendBtn setTitleColor:[UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0] forState:UIControlStateNormal];
        [_resendBtn setTitle:@"58S 重发" forState:UIControlStateNormal];
        _resendBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_resendBtn addTarget:self action:@selector(resendBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_resendBtn];

    }
    return self;
}
-(void)setBtnTitle:(NSString *)title
{
    [_resendBtn setTitle:title forState:UIControlStateNormal];

}
#pragma mark----实现类方法
+(instancetype)alterViewWithTitle:(NSString *)title
                          content:(NSString *)content
                             sure:(NSString *)sure
                    resendBtClcik:(sureBlock)resendBlock
                      sureBtClcik:(sureBlock)sureBlock
{
    LSAlertView *alterView=[[LSAlertView alloc]initWithFrame:CGRectMake(0, 0, kScreenW - 20, 220)];
    alterView.backgroundColor=[UIColor whiteColor];
    alterView.center=CGPointMake(kScreenW/2, kScreenH/2);
    alterView.layer.cornerRadius=5;
    alterView.layer.masksToBounds=YES;
    alterView.title=title;
    alterView.content=content;
    alterView.sure=sure;
    alterView.sure_block=sureBlock;
    alterView.resend_block =resendBlock;

    return alterView;
}
#pragma mark--给属性重新赋值
-(void)setTitle:(NSString *)title
{
    _titleLb.text=title;
}
-(void)setContent:(NSString *)content
{
    _contentLb.text=content;
}
-(void)setSure:(NSString *)sure
{
    [_sureBt setTitle:sure forState:UIControlStateNormal];
}


#pragma mark----确定按钮点击事件
-(void)sureBtClick
{
    [self removeFromSuperview];
    self.sure_block();
    
}

-(void)resendBtnClick
{
    //[self removeFromSuperview];
    self.resend_block();
    
}
@end
