//
//  IdentityTableViewCell.m
//  ProjectFramework
//
//  Created by apple on 2018/9/28.
//  Copyright © 2018年 李帅. All rights reserved.
//

#import "IdentityTableViewCell.h"

@implementation IdentityTableViewCell
//重写init方法构建cell内容
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = kCellbackColor;
        
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.titleShowLab];
        [self.contentView addSubview:self.arrowImage];
        [self.contentView addSubview:self.lineView];
        
        
    }
    
    return self;
}

-(UILabel *)titleLab
{
    if (_titleLab == nil) {
        //描述
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, kScreenW/2-14, 23)];
        _titleLab.font = [UIFont systemFontOfSize:16.0f];
        _titleLab.textColor = kWordLightColor;
        //        _titleLab.backgroundColor = [UIColor redColor];
    }
    return _titleLab;
}
-(UILabel *)titleShowLab
{
    if (_titleShowLab == nil) {
        //描述
        _titleShowLab = [[UILabel alloc] initWithFrame:CGRectMake(kScreenW/2, 14, kScreenW/2-15, 23)];
        _titleShowLab.font = [UIFont systemFontOfSize:16.0f];
        _titleShowLab.textColor = kWordLightColor;
        _titleShowLab.textAlignment = NSTextAlignmentRight;
        _titleShowLab.adjustsFontSizeToFitWidth = YES;
        _titleShowLab.minimumScaleFactor = 0.5;
        //        _titleLab.backgroundColor = [UIColor redColor];
    }
    return _titleShowLab;
}

-(UIImageView *)arrowImage
{
    if (_arrowImage == nil) {
        
        _arrowImage = [[UIImageView alloc] initWithFrame:CGRectMake(kScreenW -25, 17, 18, 18)];
        
        // _arrowImage.image = [UIImage imageNamed:@"right_arrow"];
    }
    return _arrowImage;
}
-(UIView *)lineView
{
    
    if (_lineView == nil) {
        self.lineView = [[UIImageView alloc]initWithFrame:CGRectMake(15, maxY(_titleLab)+12, kScreenW-15, 0.5)];
        self.lineView.backgroundColor = kWordLightColor;
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
