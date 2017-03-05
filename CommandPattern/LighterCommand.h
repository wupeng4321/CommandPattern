//
//  LighterCommand.h
//  CommandPattern
//
//  Created by wupeng on 2017/3/5.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommandProtocol.h"

@interface LighterCommand : NSObject <CommandProtocol>

/**
 *  与接收器绑定并设置参数
 *
 *  @param receiver 接收器
 *  @param paramter 参数
 */

/**
 与接收器绑定并设置参数

 @param receiver 接收器
 @param parameter 参数
 @return LighterCommand
 */
- (instancetype)initWithReceiver:(Receiver *)receiver parameter:(CGFloat)parameter;


@end
