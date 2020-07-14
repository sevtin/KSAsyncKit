//
//  KSTableViewCell.h
//  KSAsyncKit
//
//  Created by saeipi on 2020/7/14.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KSTableViewCell : UITableViewCell

/**
 初始化【供子类重写】
 */
+ (instancetype)initWithTableView:(UITableView *)tableView;

@end
