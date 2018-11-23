//
//  ViewController.m
//  QQLevelThreeList
//
//  Created by 彭倩倩 on 2018/11/23.
//  Copyright © 2018年 彭倩倩. All rights reserved.
//

#import "ViewController.h"
#import "QQLevelTableView.h"

@interface ViewController ()

/** 子视图 */
@property (nonatomic, strong) QQLevelTableView *levelTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.levelTableView];
}

#pragma mark - 懒加载区域
- (QQLevelTableView *)levelTableView {
    if (!_levelTableView) {
        _levelTableView = [[QQLevelTableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    }
    return _levelTableView;
}


@end
