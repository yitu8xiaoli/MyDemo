//
//  AddAdressTableViewCell.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/9.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "AddAdressTableViewCell.h"

@implementation AddAdressTableViewCell
//重写init方法构建cell内容
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = kCellbackColor;
        
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.titleShowText];
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.headImage];
        
        
    }
    
    return self;
}
-(UILabel *)titleLab
{
    if (_titleLab == nil) {
        //描述
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 14, 85, 23)];
        _titleLab.font = [UIFont systemFontOfSize:16.0f];
        _titleLab.textColor = RGB(255, 255, 255,1.0);
        //        _titleLab.backgroundColor = [UIColor redColor];
    }
    return _titleLab;
}
-(UITextField *)titleShowText
{
    if (_titleShowText == nil) {
        self.titleShowText = [[UITextField alloc]initWithFrame:CGRectMake(maxX(self.titleLab), 14, kScreenW -135, 23)];
        self.titleShowText.textColor = [UIColor whiteColor];


    }
    return _titleShowText;
}
-(UIImageView *)headImage
{
    if (_headImage == nil)
    {
        _headImage = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenW -35, 14, 20, 22)];
    }
    return _headImage;
}
-(UIView *)lineView
{
    if (_lineView == nil) {
        self.lineView = [[UIImageView alloc]initWithFrame:CGRectMake(15, maxY(_titleLab)+13, kScreenW-15, 0.5)];
        self.lineView.backgroundColor = RGB(255, 255, 255,0.5);
        self.lineView.alpha = 0.5;
    }
    return _lineView;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
