//
//  UIImageView+LSExtension.h
//  Project
//
//  Created by 李帅 on 2017/2/15.
//  Copyright © 2017年 YiTu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (LSExtension)

/**
 添加网络图片

 @param cornerRadius 圆角。这里不会发生离屏渲染
 @param url url
 @param placeholder 占位图
 */
- (void)ls_setImageWithCornerRadius:(CGFloat)cornerRadius
                                url:(NSString *)url
                        placeholder:(UIImage *)placeholder;

@end
