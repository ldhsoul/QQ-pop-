//
//  DHBarrageChannel.h
//  QQ音乐弹幕
//
//  Created by fubang on 2019/8/7.
//  Copyright © 2019 ldh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DHBarrageViewCell;
@interface DHBarrageChannel : NSObject

/// 通道标识
@property (assign ,nonatomic ,readonly) NSInteger channelIndex;

/// 通道在 DHBarrageView 上对应的 y 坐标
@property (assign ,nonatomic ,readonly) CGFloat y;

/// 获取当前通道中所有的弹幕 cell
@property (strong ,nonatomic ,readonly) NSHashTable <DHBarrageViewCell *>*cells;

/// 记录最后一个添加到该通道的弹幕 cell
@property (weak ,nonatomic) DHBarrageViewCell *lastCell;

@end


