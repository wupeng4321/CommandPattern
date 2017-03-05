//
//  Invoker.m
//  CommandPattern
//
//  Created by wupeng on 2017/3/5.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import "Invoker.h"

@interface Invoker()

@property (nonatomic, strong) NSMutableArray *queue;

@end

@implementation Invoker

+ (instancetype)shareInstance {
    
    static Invoker *shareInstanceValue = nil;
    static dispatch_once_t oncePredicate;
    
    dispatch_once(&oncePredicate, ^{
        
        shareInstanceValue       = [[Invoker alloc] init];
        shareInstanceValue.queue = [NSMutableArray array];
    });
    
    return shareInstanceValue;
}

- (void)rollBack {
    
    id <CommandProtocol> command = self.queue.lastObject;
    [command rollBackExcute];
    
    [self.queue removeLastObject];
}

- (void)addAndExcute:(id <CommandProtocol>)command {
    
    NSParameterAssert(command);
    
    [self.queue addObject:command];
    [command excute];
}

@end
