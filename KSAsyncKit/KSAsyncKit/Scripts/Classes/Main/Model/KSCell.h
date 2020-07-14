//
//  KSCell.h
//  KSAsyncKit
//
//  Created by saeipi on 2020/7/14.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, KSCellType) {
    KSCellTypeTableNode = 0,
};

@interface KSCell : NSObject

@property(nonatomic,assign)KSCellType type;
@property(nonatomic,copy)NSString *title;

+(NSMutableArray *)constructData;

@end
