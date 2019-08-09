//
//  DHBarrageViewCell.h
//  QQ音乐弹幕
//
//  Created by fubang on 2019/8/7.
//  Copyright © 2019 ldh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHBarrageMessage.h"

@interface DHBarrageViewCell : UIControl

/// 绑定的弹幕消息
@property (strong ,nonatomic ,readonly) DHBarrageMessage *message;

/// 重写生成自定义子视图，需要在这个方法里计算自身宽度并返回
- (CGFloat)setupSubviews:(NSInteger)ids;

@end

