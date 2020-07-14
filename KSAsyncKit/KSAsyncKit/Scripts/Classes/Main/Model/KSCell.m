//
//  KSCell.m
//  KSAsyncKit
//
//  Created by saeipi on 2020/7/14.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import "KSCell.h"

@implementation KSCell

-(instancetype)initWidthType:(KSCellType)type title:(NSString *)title {
    if (self = [super init]) {
        self.type = type;
        self.title = title;
    }
    return self;
}

+(NSMutableArray *)constructData {
    NSMutableArray *array = [NSMutableArray array];
    KSCell *data = [[KSCell alloc] initWidthType:KSCellTypeTableNode title:@"TableNode"];
    [array addObject:data];
    return array;
}

@end
