//
//  QQLevelModel.h
//  QQLevelThreeList
//
//  Created by 彭倩倩 on 2018/11/23.
//  Copyright © 2018年 彭倩倩. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QQLevelModel : NSObject

@property (nonatomic, assign) NSInteger firstIndex;
@property (nonatomic, assign) NSInteger secondIndex;
@property (nonatomic, assign) NSInteger thirdIndex;

@property (nonatomic, assign) BOOL isShow;
@property (nonatomic, assign) BOOL isOpen;

/** 描述 */
@property (nonatomic, copy) NSString *depict;

@end

NS_ASSUME_NONNULL_END
