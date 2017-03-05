//
//  ViewController.m
//  CommandPattern
//
//  Created by wupeng on 2017/3/5.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import "ViewController.h"
#import "Receiver.h"
#import "Invoker.h"
#import "DarkerCommand.h"
#import "LighterCommand.h"

typedef enum : NSUInteger {
    
    kAddButtonTag,      // 增加按钮枚举值
    kDelButtonTag,      // 减少按钮枚举值
    kRolButtonTag,      // 回退按钮枚举值
    
} ViewControllerEnumValue;

@interface ViewController ()

@property (nonatomic, strong) UIButton *addButton;
@property (nonatomic, strong) UIButton *delButton;
@property (nonatomic, strong) UIButton *rolButton;

@property (nonatomic, strong) Receiver *receiver;

@end


@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 接收器
    self.receiver            = [[Receiver alloc] init];
    self.receiver.clientView = self.view;
    
    // 初始化按钮
    [self initButtons];
}

- (void)buttonsEvent:(UIButton *)button {
    
    if (button.tag == kAddButtonTag) {
        
        NSLog(@"增加操作");
        LighterCommand *command = [[LighterCommand alloc] initWithReceiver:self.receiver parameter:0.1];
        [[Invoker shareInstance] addAndExcute:command];
        
    } else if (button.tag == kDelButtonTag) {
        
        NSLog(@"减少操作");
        DarkerCommand *commond = [[DarkerCommand alloc] initWithReceiver:self.receiver parameter:0.1];
        [[Invoker shareInstance] addAndExcute:commond];
        
    } else if (button.tag == kRolButtonTag) {
        
        NSLog(@"回退操作");
        [[Invoker shareInstance] rollBack];
    }
}

#pragma mark - 无关初始化
- (void)initButtons {
    
    // delButton
    self.delButton     = [[UIButton alloc] initWithFrame:CGRectMake(10, 25, 30, 30)];
    
    self.delButton.tag               = kDelButtonTag;
    self.delButton.layer.borderWidth = 1.f;
    
    [self.delButton setTitle:@"-"
                    forState:UIControlStateNormal];
    
    [self.delButton setTitleColor:[UIColor redColor]
                         forState:UIControlStateNormal];
    
    [self.delButton addTarget:self
                       action:@selector(buttonsEvent:)
             forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.delButton];
    
    // addButton
    self.addButton     = [[UIButton alloc] initWithFrame:CGRectMake(10 + 40, 25, 30, 30)];
    
    self.addButton.tag               = kAddButtonTag;
    self.addButton.layer.borderWidth = 1.f;
    
    [self.addButton setTitle:@"+"
                    forState:UIControlStateNormal];
    
    [self.addButton setTitleColor:[UIColor redColor]
                         forState:UIControlStateNormal];
    
    [self.addButton addTarget:self
                       action:@selector(buttonsEvent:)
             forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.addButton];
    
    // rolButton
    self.rolButton     = [[UIButton alloc] initWithFrame:CGRectMake(10 + 80, 25, 90, 30)];
    
    self.rolButton.tag               = kRolButtonTag;
    self.rolButton.layer.borderWidth = 1.f;
    
    [self.rolButton setTitle:@"rollBack"
                    forState:UIControlStateNormal];
    
    [self.rolButton setTitleColor:[UIColor redColor]
                         forState:UIControlStateNormal];
    
    [self.rolButton addTarget:self
                       action:@selector(buttonsEvent:)
             forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.rolButton];
}

@end
