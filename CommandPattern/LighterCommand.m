//
//  LighterCommand.m
//  CommandPattern
//
//  Created by wupeng on 2017/3/5.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import "LighterCommand.h"


@interface LighterCommand ()

@property (nonatomic, weak) Receiver *receiver;

@property (nonatomic, assign) CGFloat   parameter;

@end


@implementation LighterCommand

- (instancetype)initWithReceiver:(Receiver *)receiver parameter:(CGFloat)parameter {
    
    self = [super init];
    if (self) {
        
        self.receiver = receiver;
        self.parameter = parameter;
    }
    
    return self;
}

- (void)excute {
    
    [self.receiver makeLighter:self.parameter];
}

- (void)rollBackExcute {
    
    [self.receiver makeDarker:self.parameter];
}


@end
