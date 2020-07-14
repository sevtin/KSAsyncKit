//
//  KSCellNode.m
//  KSAsyncKit
//
//  Created by saeipi on 2020/7/14.
//  Copyright © 2020 saeipi. All rights reserved.
//

#import "KSCellNode.h"

@interface KSCellNode()<ASNetworkImageNodeDelegate>

@end
@implementation KSCellNode

-(instancetype)initWithData:(KSCellNodeModel *)data {
    if (self = [super init]) {
        
        ASDisplayNode *bgViewNode = [[ASDisplayNode alloc] init];
        bgViewNode.frame = CGRectMake(0, 0, 375, 360);
        bgViewNode.backgroundColor = [UIColor redColor];
        [self addSubnode:bgViewNode];
        
        ASNetworkImageNode *imgViewNode = [[ASNetworkImageNode alloc] init];
        imgViewNode.frame = CGRectMake(10, 10, 355, 340);
        imgViewNode.backgroundColor = [UIColor greenColor];
        imgViewNode.URL = [NSURL URLWithString:data.imgUrl];
        imgViewNode.delegate = self;
        imgViewNode.contentMode = UIViewContentModeScaleAspectFill;
        [bgViewNode addSubnode:imgViewNode];
        
        ASTextNode *labelNode = [[ASTextNode alloc] init];
        labelNode.frame = CGRectMake(20, 150, 260, 30);
        labelNode.attributedText = [[NSAttributedString alloc] initWithString:data.text attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:18], NSForegroundColorAttributeName:[UIColor blackColor], NSBackgroundColorAttributeName : [UIColor clearColor]}];
        [bgViewNode addSubnode:labelNode];
    }
    return self;
}

#pragma mark - 图片下载代理
- (void)imageNode:(ASNetworkImageNode *)imageNode didLoadImage:(UIImage *)image {
    
}

- (void)imageNodeDidStartFetchingData:(ASNetworkImageNode *)imageNode {
    
}
- (void)imageNode:(ASNetworkImageNode *)imageNode didFailWithError:(NSError *)error
{
    
}
- (void)imageNodeDidFinishDecoding:(ASNetworkImageNode *)imageNode {
    
}
@end
