//
//  CAAnimationTool.h
//  QQ音乐弹幕
//
//  Created by fubang on 2019/8/7.
//  Copyright © 2019 ldh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CAAnimationTool : NSObject

/// 缩放
+ (CABasicAnimation *)scaleAnimationFromValue:(CGFloat)fromValue toValue:(CGFloat)tovalue duration:(CGFloat)duration;

/// 平移-y
+ (CABasicAnimation *)positionYAnimationFromValue:(CGFloat)fromValue toValue:(CGFloat)tovalue duration:(CGFloat)duration;

/// 平移-x
+ (CABasicAnimation *)positionXAnimationFromValue:(CGFloat)fromValue toValue:(CGFloat)tovalue duration:(CGFloat)duration;

/// 透明度
+ (CABasicAnimation *)opacityAnimationFromValue:(CGFloat)fromValue toValue:(CGFloat)tovalue duration:(CGFloat)duration;

@end

