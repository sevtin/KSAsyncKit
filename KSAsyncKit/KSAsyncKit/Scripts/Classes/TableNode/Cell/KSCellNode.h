//
//  KSCellNode.h
//  KSAsyncKit
//
//  Created by saeipi on 2020/7/14.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "KSCellNodeModel.h"

@interface KSCellNode : ASCellNode

-(instancetype)initWithData:(KSCellNodeModel *)data;

@end

