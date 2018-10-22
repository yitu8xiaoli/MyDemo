//
//  TradingTableViewCell.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/17.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "TradingTableViewCell.h"

@implementation TradingTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = kCellbackColor;
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.lineView];
        [self.contentView addSubview:self.titlabShowText];

        
        
    }
    return self;
}

-(UILabel *)titleLab
{
    if (_titleLab == nil) {
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(16, 14,100, 23)];
        _titleLab.font = [UIFont systemFontOfSize:16.0f];
        _titleLab.textAlignment = NSTextAlignmentLeft;
        _titleLab.textColor = [UIColor whiteColor];
        _titleLab.adjustsFontSizeToFitWidth = YES;
        _titleLab.minimumScaleFactor = 0.5;
        _titleLab.text = @"定价方式";
    }
    return _titleLab;
}
-(UITextField *)titlabShowText
{
    if (_titlabShowText == nil) {
        self.titlabShowText = [[UITextField alloc]initWithFrame:CGRectMake(maxX(self.titleLab), 14, kScreenW-130, 23)];
        self.titlabShowText.placeholder = @"请输入你的真实姓名";
        [self.titlabShowText setValue:RGB(255, 255, 255, 0.56) forKeyPath:@"_placeholderLabel.textColor"];
        self.titlabShowText.font = [UIFont systemFontOfSize:16];
        [self.titlabShowText setValue:[UIFont boldSystemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
        self.titlabShowText.textColor = [UIColor whiteColor];
    }
    return _titlabShowText;
}
-(UIView *)lineView
{
    
    if (_lineView == nil) {
        self.lineView = [[UIImageView alloc]initWithFrame:CGRectMake(15, maxY(_titleLab)+12, kScreenW-15, 0.5)];
        self.lineView.backgroundColor = kWordGrayColor;
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
