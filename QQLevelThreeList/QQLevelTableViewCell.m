//
//  QQLevelTableViewCell.m
//  QQLevelThreeList
//
//  Created by 彭倩倩 on 2018/11/23.
//  Copyright © 2018年 彭倩倩. All rights reserved.
//

#import "QQLevelTableViewCell.h"

@implementation QQLevelTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)setModel:(QQLevelModel *)model {
    _model = model;
    self.layer.masksToBounds = YES;
    NSString *depict;
    if (model.secondIndex == 0 && model.thirdIndex == 0) {
        depict = [@"① - " stringByAppendingString:model.depict];
        self.backgroundColor = [UIColor colorWithRed:212/255.0 green:226/255.0 blue:208/255.0 alpha:1];
    } else if (model.thirdIndex == 0) {
        depict = [@"    ② - " stringByAppendingString:model.depict];
        self.backgroundColor = [UIColor colorWithRed:212/255.0 green:201/255.0 blue:194/255.0 alpha:1];
    } else {
        depict = [@"        ③ - " stringByAppendingString:model.depict];
        self.backgroundColor = [UIColor colorWithRed:212/255.0 green:177/255.0 blue:176/255.0 alpha:1];
    }
    self.textLabel.text = depict;
}

@end
