//
//  Receiver.h
//  CommandPattern
//
//  Created by wupeng on 2017/3/5.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Receiver : NSObject

@property (nonatomic, assign) CGFloat hud;
@property (nonatomic, assign) CGFloat saturation;
@property (nonatomic, assign) CGFloat brightness;
@property (nonatomic, assign) CGFloat alpha;


//被服务对象
@property (nonatomic, weak) UIView  *clientView;

/**
 变暗

 @param pamameter  操作系数
 */
- (void)makeDarker:(CGFloat)pamameter;

/**
 变亮

 @param parameter 操作系数
 */
- (void)makeLighter:(CGFloat)parameter;


@end
