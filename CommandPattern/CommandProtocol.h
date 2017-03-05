//
//  CommandProtocol.h
//  CommandPattern
//
//  Created by wupeng on 2017/3/5.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Receiver.h"

@protocol CommandProtocol <NSObject>

@required

//命令的执行
- (void)excute;

//撤销命令
- (void)rollBackExcute;

@end
