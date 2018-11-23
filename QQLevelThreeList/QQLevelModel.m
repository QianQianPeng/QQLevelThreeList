//
//  QQLevelModel.m
//  QQLevelThreeList
//
//  Created by 彭倩倩 on 2018/11/23.
//  Copyright © 2018年 彭倩倩. All rights reserved.
//

#import "QQLevelModel.h"

@implementation QQLevelModel

- (instancetype)init {
    if (self = [super init]) {
        self.firstIndex = 0;
        self.secondIndex = 0;
        self.thirdIndex = 0;
        self.isShow = YES;
        self.isOpen = NO;
    }
    return self;
}

@end
