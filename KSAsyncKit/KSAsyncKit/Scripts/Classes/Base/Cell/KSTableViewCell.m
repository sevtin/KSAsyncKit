//
//  KSTableViewCell.m
//  KSAsyncKit
//
//  Created by saeipi on 2020/7/14.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import "KSTableViewCell.h"

@implementation KSTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//重用标识
static NSString *cellIdentifier = @"WonBaseTableViewCell";
/**
 初始化【供子类重写】
 */
+ (instancetype)initWithTableView:(UITableView *)tableView {
    KSTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    return  cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initializeCell];
    }
    return self;
}
/**
 初始化数据和视图【供子类调用】
 */
- (void)initializeCell {
    [self configureDefault];
    [self createChildViews];
}

/**
 设置默认值【供子类重写】
 */
- (void)configureDefault {
    
}

/**
 创建视图【供子类重写】
 */
- (void)createChildViews {
    
}

@end
