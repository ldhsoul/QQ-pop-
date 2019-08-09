//
//  DHBarrageView.h
//  QQ音乐弹幕
//
//  Created by fubang on 2019/8/7.
//  Copyright © 2019 ldh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHBarrageMessage.h"

@interface DHBarrageView : UIView

/// 下边距
@property (assign ,nonatomic) CGFloat bottomSpacing;

/// 设置最多有多少通道
@property (assign ,nonatomic) NSInteger channelCount;

/// 设置通道高度
@property (assign ,nonatomic) CGFloat channelHeight;

/// 设置自定义弹幕cell类
@property (strong ,nonatomic) Class cellClass;

/// 通道之间的间距
@property (assign ,nonatomic) CGFloat lineSpacing;

/// 收到一条弹幕消息
- (void)receivedMessage:(DHBarrageMessage *)message;

/// 立即销毁内部定时器
- (void)destroy;

@end
