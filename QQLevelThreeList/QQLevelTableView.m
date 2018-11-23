//
//  QQLevelTableView.m
//  QQLevelThreeList
//
//  Created by 彭倩倩 on 2018/11/23.
//  Copyright © 2018年 彭倩倩. All rights reserved.
//

#import "QQLevelTableView.h"
#import "QQLevelDataModel.h"
#import "QQLevelModel.h"
#import "QQLevelTableViewCell.h"

@interface QQLevelTableView()<UITableViewDelegate, UITableViewDataSource>
/** 数据源 */
@property (nonatomic, strong) QQLevelDataModel *dataModel;
@end

@implementation QQLevelTableView

static NSString *QQLevelTableViewCellID = @"QQLevelTableViewCellID";

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        self.backgroundColor = [UIColor whiteColor];
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableFooterView = [[UIView alloc] init];
        self.showsVerticalScrollIndicator = NO;
        self.showsHorizontalScrollIndicator = NO;
        [self registerClass:[QQLevelTableViewCell class] forCellReuseIdentifier:QQLevelTableViewCellID];
    }
    return self;
}

#pragma mark --- tableView 代理 ---
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataModel.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    QQLevelModel *model = self.dataModel.dataArray[indexPath.row];
    return model.isShow ? 44 : 0.0000001;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QQLevelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:QQLevelTableViewCellID forIndexPath:indexPath];
    QQLevelModel *model = self.dataModel.dataArray[indexPath.row];
    cell.model = model;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    QQLevelModel *current_model = self.dataModel.dataArray[indexPath.row];
    // 如果点击的是一级cell
    if (current_model.secondIndex == 0 && current_model.thirdIndex == 0) {
        current_model.isOpen = !current_model.isOpen;
        NSMutableArray *indexPathArray = @[].mutableCopy;
        [self.dataModel.dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            QQLevelModel *model = obj;
            BOOL is_belong = model.firstIndex == current_model.firstIndex;    //是否在当前分组
            BOOL is_current = model.secondIndex == 0;                           //是否是一级cell
            //如果在当前分组下，并且不是一级cell,则全部隐藏，关闭
            if (is_belong && !is_current) {
                model.isShow = !current_model.isOpen;
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idx inSection:0];
                [indexPathArray addObject:indexPath];
            }
        }];
        [self reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationFade];
        return;
    }
    
    // 如果点击的是二级cell
    if (current_model.thirdIndex == 0) {
        NSMutableArray *indexPathArray = @[].mutableCopy;
        [self.dataModel.dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            QQLevelModel *model = obj;
            BOOL is_belong = model.secondIndex == current_model.secondIndex && model.firstIndex == current_model.firstIndex;  //是否在当前分组
            BOOL is_current = model.thirdIndex == 0;                           // 是否是二级cell
            //如果在当前分组下，并且不是二级cell，则全部隐藏
            if (is_belong && !is_current) {
                model.isShow = !model.isShow;
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idx inSection:0];
                [indexPathArray addObject:indexPath];
            }
        }];
        [self reloadRowsAtIndexPaths:indexPathArray withRowAnimation:UITableViewRowAnimationFade];
        return;
    }
}

- (QQLevelDataModel *)dataModel {
    if (!_dataModel) {
        _dataModel = [[QQLevelDataModel alloc] init];
    }
    return _dataModel;
}

@end
