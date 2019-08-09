//
//  DHBarrageView.m
//  QQ音乐弹幕
//
//  Created by fubang on 2019/8/7.
//  Copyright © 2019 ldh. All rights reserved.
//

#import "DHBarrageView.h"
#import "DHBarrageChannel.h"
#import "DHBarrageViewCell.h"
#import "CAAnimationTool.h"

@interface DHBarrageView ()<CAAnimationDelegate>

@property (strong ,nonatomic) CADisplayLink *timer;
@property (strong ,nonatomic) NSArray <DHBarrageChannel *>*channels; // 当前所有通道
@property (strong ,nonatomic) NSMutableArray <DHBarrageMessage *>*barrageMessages; // 队列内的消息
@property (strong ,nonatomic) NSMutableArray <DHBarrageViewCell *>*barrageCells; // cell缓存队列内的

@end

@implementation DHBarrageView

- (instancetype)init {
    if (self= [super init]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return  self;
}

- (void)setup {
    self.backgroundColor = nil;
    self.clipsToBounds = YES;
    _bottomSpacing = [UIApplication sharedApplication].statusBarFrame.size.height + 20.f;
    _channelCount = 6;
    _channelHeight = 44.f;
    _lineSpacing = 5.f;
    _cellClass = [DHBarrageViewCell class];
    _barrageMessages = [NSMutableArray array];
    _barrageCells = [NSMutableArray array];
}

// 收到一条弹幕消息
- (void)receivedMessage:(DHBarrageMessage *)message {
  
    NSInteger iIndex = [self iIndex];
    if (iIndex == -1) {
        /// 通道满了就移除第一条弹幕 -> 消息队列添加 -> 一条消息 -> cell缓存队列移除最后一个 -> 开启定时器检测 -> 等待通道释放 -> 更新
        [self.subviews.firstObject removeFromSuperview];
        [_barrageMessages addObject:message];
        [_barrageCells removeLastObject];
        if (!_timer) {
            _timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(update)];
            [_timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        }
    } else {
        /// 有空余通道直接显示
        [self showBarrageCellWithBarrageMessage:message iIndex:iIndex];
    }
}

// 返回一个可用的通道，没有可用通道返回-1
- (NSInteger)iIndex {
    for (DHBarrageChannel *channel in _channels) {
        if (!channel.lastCell) {
            return channel.channelIndex;
        }
    }
    return -1;
}

// 显示弹幕消息
- (void)showBarrageCellWithBarrageMessage:(DHBarrageMessage *)message iIndex:(NSInteger)iIndex {
    if (!_cellClass) {
        _cellClass = [DHBarrageViewCell class];
    }
    DHBarrageChannel *channel = _channels[iIndex]; // 获取通道
    DHBarrageViewCell *cell = [[_cellClass alloc] initWithFrame:CGRectMake(0, 0, 0, _channelHeight)];
    [cell setValue:message forKey:@"message"];
    cell.frame = ({
        CGRect frame = cell.frame;
        frame.size.width = [cell setupSubviews:iIndex];
        frame.origin.x = 0;
        frame.origin.y = self.frame.size.height-(_channelHeight+_lineSpacing);
        frame.size.height = _channelHeight;
        frame;
    });
    [self addSubview:cell];
    [channel.cells addObject:cell];
    channel.lastCell = cell;
    [_barrageCells insertObject:cell atIndex:0];
    cell.layer.anchorPoint = CGPointMake(0, 1);
    [self.layer addSublayer:cell.layer];
    // 创建组动画
    CAAnimation *animScale = [CAAnimationTool scaleAnimationFromValue:0 toValue:1.f duration:0.3];
    CAAnimation *opacity = [CAAnimationTool opacityAnimationFromValue:0 toValue:1.f duration:0.3];
    CAAnimation *animx = [CAAnimationTool positionXAnimationFromValue:0 toValue:10 duration:0.3];
    CAAnimation *animy = [CAAnimationTool positionYAnimationFromValue:self.frame.size.height toValue:self.frame.size.height-_channelHeight-_lineSpacing - _channelHeight/2 duration:0.3];
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.animations = @[animScale,opacity,animx,animy];
    group.duration = 1.0;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    group.delegate = self;
    [cell.layer addAnimation:group forKey:nil];
}

- (void)update {
    NSInteger cellCount = 0;
    DHBarrageMessage *message = _barrageMessages.firstObject;
    if (message) {
        NSInteger idleIndex = [self iIndex];
        if (idleIndex >= 0) {
            [_barrageMessages removeObject:message];
            [self showBarrageCellWithBarrageMessage:message iIndex:idleIndex];
            cellCount ++;
        }
    }
    if (cellCount <= 0) {
        [self destroy]; // 检测到没有弹幕时自动销毁定时器
    }
}

#pragma mark -

- (void)reloadConfig {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:_channelCount];
    for (int i = 0; i < _channelCount; i ++) {
        DHBarrageChannel *channel = [[DHBarrageChannel alloc] init];
        [channel setValue:@(i) forKey:@"channelIndex"];
        array[i] = channel;
    }
    _channels = [array copy];
}

- (void)setBottomSpacing:(CGFloat)bottomSpacing {
    _bottomSpacing = bottomSpacing;
    [self reloadConfig];
}

#pragma mark -
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
}
// 每次组动画开始时遍历已显示cell并上移
- (void)animationDidStart:(CAAnimation *)anim {

    if (_barrageCells.count > 1) {
        for(NSInteger i = 1; i <= _barrageCells.count - 1; i++){
            DHBarrageViewCell *cell = _barrageCells[i];
            CAAnimation *animy = [CAAnimationTool positionYAnimationFromValue:cell.layer.frame.origin.y-(_channelHeight+_lineSpacing)*(i-1) toValue:cell.layer.frame.origin.y-(_channelHeight+_lineSpacing)*i duration:0.3];
            [cell.layer addAnimation:animy forKey:nil];
        }
    }
}
#pragma mark -
// 立即销毁内部定时器
- (void)destroy; {
    [_timer invalidate];
    _timer = nil;
}

- (void)dealloc {
#if DEBUG
    NSLog(@"%s" ,__func__);
#endif
}

@end
