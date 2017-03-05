//
//  Receiver.m
//  CommandPattern
//
//  Created by wupeng on 2017/3/5.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import "Receiver.h"

@implementation Receiver

- (void)setClientView:(UIView *)clientView {
    
    _clientView    = clientView;
    UIColor *color = _clientView.backgroundColor;
    
    [color getHue:&_hud
       saturation:&_saturation
       brightness:&_brightness
            alpha:&_alpha];
}

- (void)makeDarker:(CGFloat)pamameter {
    
    _brightness -= pamameter;
    _brightness  = MAX(0, _brightness);
    
    _clientView.backgroundColor = [UIColor colorWithHue:_hud
                                             saturation:_saturation
                                             brightness:_brightness
                                                  alpha:_alpha];
}

- (void)makeLighter:(CGFloat)pamameter {
    
    _brightness += pamameter;
    _brightness  = MIN(1, _brightness);
    
    _clientView.backgroundColor = [UIColor colorWithHue:_hud
                                             saturation:_saturation
                                             brightness:_brightness
                                                  alpha:_alpha];
}


@end
