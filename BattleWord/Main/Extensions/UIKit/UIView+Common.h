//
//  UIView+Common.h
//  DriverSide
//
//  Created by yuanfa deng on 15/12/11.
//  Copyright © 2015年 QZF. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  获取视图位置信息的类别
 */
@interface UIView (Postion)
/**
 *  获取屏幕的宽
 *
 *  @return 屏幕的宽
 */
CGFloat screenWidth();

/**
 *  获取屏幕的高
 *
 *  @return 屏幕的高
 */
CGFloat screenHeight();

///返回frem视图的宽高
-(CGFloat)width;
-(CGFloat)hight;

//返回当前视图的宽高
CGFloat width(CGRect rect);
CGFloat hight(CGRect rect);



CGFloat maxX(UIView *view);
CGFloat midX(UIView *view);
CGFloat minX(UIView *view);
CGFloat maxY(UIView *view);
CGFloat midY(UIView *view);
CGFloat minY(UIView *view);


@end

@interface UIView (Common)

@end
