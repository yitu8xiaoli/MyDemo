//
//  UIView+Common.m
//  DriverSide
//
//  Created by yuanfa deng on 15/12/11.
//  Copyright © 2015年 QZF. All rights reserved.
//
#import "UIView+Common.h"

@implementation UIView (Postion)
/**
 *  获取屏幕的宽
 *
 *  @return 屏幕的宽
 */
CGFloat screenWidth() {
    return [[UIScreen mainScreen] bounds].size.width;
}
/**
 *  获取屏幕的高
 *
 *  @return 屏幕的高
 */
CGFloat screenHeight() {
    return [[UIScreen mainScreen] bounds].size.height;
}
///返回视图的宽和高
-(CGFloat)width{
    return self.frame.size.width;
}
-(CGFloat)hight{
    return self.frame.size.height;
}
///返回视图rect

CGFloat width(CGRect rect){
    return CGRectGetWidth(rect);

}
CGFloat hight(CGRect rect){
    return CGRectGetHeight(rect);
    
}

CGFloat maxX(UIView *view){
    return CGRectGetMaxX(view.frame);
}
CGFloat midX(UIView *view){
    return CGRectGetMidX(view.frame);
}
CGFloat minX(UIView *view){
    return CGRectGetMinX(view.frame);
}
CGFloat maxY(UIView *view){
    return CGRectGetMaxY(view.frame);
}
CGFloat midY(UIView *view){
    return CGRectGetMidY(view.frame);
}
CGFloat minY(UIView *view){
    return CGRectGetMinY(view.frame);
}

@end

@implementation UIView (Common)

@end
