//
//  DHBarrageChannel.m
//  QQ音乐弹幕
//
//  Created by fubang on 2019/8/7.
//  Copyright © 2019 ldh. All rights reserved.
//

#import "DHBarrageChannel.h"

@implementation DHBarrageChannel

- (id)init {
    self = [super init];
    if (self) {
        _cells = [[NSHashTable alloc] initWithOptions:NSPointerFunctionsWeakMemory capacity:10];
    } return self;
}

@end
