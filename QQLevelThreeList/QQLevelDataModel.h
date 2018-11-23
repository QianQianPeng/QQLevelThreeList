//
//  QQLevelDataModel.h
//  QQLevelThreeList
//
//  Created by 彭倩倩 on 2018/11/23.
//  Copyright © 2018年 彭倩倩. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QQLevelDataModel : NSObject

/** 一级数据 */
@property (nonatomic, copy) NSArray *firstLevelData;

/** 二级数据 */
@property (nonatomic, strong) NSMutableDictionary *secondLevelData;

/** 三级数据 */
@property (nonatomic, strong) NSMutableDictionary *thirdLevelData;

/** 总数据 */
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

NS_ASSUME_NONNULL_END
