//
//  Invoker.h
//  CommandPattern
//
//  Created by wupeng on 2017/3/5.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "CommandProtocol.h"

@interface Invoker : NSObject

+ (instancetype)shareInstance;

- (void)rollBack;

- (void)addAndExcute:(id <CommandProtocol>)command;

@end
