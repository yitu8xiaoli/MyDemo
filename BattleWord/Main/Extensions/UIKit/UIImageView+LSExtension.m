//
//  UIImageView+LSExtension.m
//  Project
//
//  Created by 李帅 on 2017/2/15.
//  Copyright © 2017年 YiTu. All rights reserved.
//

#import "UIImageView+LSExtension.h"
#import <objc/runtime.h>
#import <YYWebImage/YYWebImage.h>

@implementation UIImageView (LSExtension)

- (void)ls_setImageWithCornerRadius:(CGFloat)cornerRadius url:(NSString *)url placeholder:(UIImage *)placeholder {
    [self yy_setImageWithURL:[NSURL URLWithString:url] placeholder:placeholder options:YYWebImageOptionShowNetworkActivity progress:^(NSInteger receivedSize, NSInteger expectedSize) {
        
    } transform:^UIImage * _Nullable(UIImage * _Nonnull image, NSURL * _Nonnull url) {
        return [image yy_imageByRoundCornerRadius:cornerRadius];
    } completion:^(UIImage * _Nullable image, NSURL * _Nonnull url, YYWebImageFromType from, YYWebImageStage stage, NSError * _Nullable error) {
        
    }];
}

@end
