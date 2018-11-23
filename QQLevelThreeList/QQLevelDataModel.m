//
//  QQLevelDataModel.m
//  QQLevelThreeList
//
//  Created by 彭倩倩 on 2018/11/23.
//  Copyright © 2018年 彭倩倩. All rights reserved.
//

#import "QQLevelDataModel.h"
#import "QQLevelModel.h"

@implementation QQLevelDataModel

- (instancetype)init {
    if (self = [super init]) {
        self.dataArray = @[].mutableCopy;
        [self initDataArray];
    }
    return self;
}

// 模拟网络请求
- (void)initDataArray {
    NSString *plistPath = [[NSBundle mainBundle]pathForResource:@"levelData" ofType:@"plist"];
    NSDictionary *dataDic = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    NSArray *array = dataDic[@"entity"];
    
    // 一级
    for (NSInteger i = 0; i < array.count; i++) {
        QQLevelModel *model = [[QQLevelModel alloc] init];
        model.depict = array[i][@"depict"];
        model.firstIndex = i+1;
        [self.dataArray addObject:model];
        // 二级
        NSArray *secondLevelData = array[i][@"secondLevelData"];
        for (NSInteger j = 0; j < secondLevelData.count; j++) {
            QQLevelModel *model = [[QQLevelModel alloc] init];
            model.depict = secondLevelData[j][@"depict"];
            model.firstIndex = i+1;
            model.secondIndex = j+1;
            [self.dataArray addObject:model];
            NSArray *thirdLevelData = secondLevelData[j][@"thirdLevelData"];
            // 三级
            [thirdLevelData enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                QQLevelModel *model = [[QQLevelModel alloc] init];
                model.firstIndex = i+1;
                model.secondIndex = j+1;
                model.thirdIndex = idx+1;
                model.depict = obj[@"depict"];
                [self.dataArray addObject:model];
            }];
        }
    }
}



@end
