//
//  DHBarrageMessage.h
//  QQ音乐弹幕
//
//  Created by fubang on 2019/8/7.
//  Copyright © 2019 ldh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DHBarrageMessage : NSObject

- (id)init;

/// 设置弹幕滚动速度,当设置0或者小于0时为随机速度(0.5 - 1.5)
@property (assign ,nonatomic) CGFloat speed;

/// 记录弹幕数据
@property (strong ,nonatomic) id body;

@end

