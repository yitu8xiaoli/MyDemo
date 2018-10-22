//
//  IntervalTableViewCell.m
//  ProjectFramework
//
//  Created by 中链 on 2018/10/17.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "IntervalTableViewCell.h"

@implementation IntervalTableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = kCellbackColor;
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.beginText];

        [self.contentView addSubview:self.lineOneView];

        [self.contentView addSubview:self.allText];
        [self.contentView addSubview:self.otherLab];
        [self.contentView addSubview:self.lineView];

      
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
        _titleLab.text = @"单笔限额";
    }
    return _titleLab;
}
-(UITextField *)beginText
{
    if (_beginText == nil) {
        self.beginText = [[UITextField alloc]initWithFrame:CGRectMake(maxX(self.titleLab), 14, 66, 23)];
        self.beginText.placeholder = @"100";
        [self.beginText setValue:RGB(255, 255, 255, 0.56) forKeyPath:@"_placeholderLabel.textColor"];
        self.beginText.font = [UIFont systemFontOfSize:12];
        [self.beginText setValue:[UIFont boldSystemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
        self.beginText.textColor = [UIColor whiteColor];
    }
    return _beginText;
}
-(UIView *)lineOneView
{
    
    if (_lineOneView == nil) {
        self.lineOneView = [[UIImageView alloc]initWithFrame:CGRectMake(maxX(_beginText), 24, 8, 1)];
        self.lineOneView.backgroundColor = RGB(255, 255, 255, 0.24);
    }
    return _lineOneView;
}
-(UITextField *)allText
{
    if (_allText == nil) {
        self.allText = [[UITextField alloc]initWithFrame:CGRectMake(maxX(self.lineOneView), 14, 66, 23)];
        self.allText.placeholder = @"总金额";
        [self.allText setValue:RGB(255, 255, 255, 0.56) forKeyPath:@"_placeholderLabel.textColor"];
        self.allText.font = [UIFont systemFontOfSize:12];
        self.allText.textAlignment = NSTextAlignmentRight;
        [self.allText setValue:[UIFont boldSystemFontOfSize:12] forKeyPath:@"_placeholderLabel.font"];
        self.allText.textColor = [UIColor whiteColor];
    }
    return _allText;
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
-(UILabel *)otherLab
{
    if (_otherLab == nil) {
        _otherLab = [[UILabel alloc] initWithFrame:CGRectMake(kScreenW-71, 14,30, 23)];
        _otherLab.font = [UIFont systemFontOfSize:16.0f];
        _otherLab.textAlignment = NSTextAlignmentLeft;
        _otherLab.textColor = RGB(255, 255, 255, 0.56);
        _otherLab.adjustsFontSizeToFitWidth = YES;
        _otherLab.minimumScaleFactor = 0.5;
        _otherLab.text = @"CNY";
    }
    return _otherLab;
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
