//
//  CBCustomFunctionView.m
//  MyTest
//
//  Created by 崔兵兵 on 16/3/31.
//  Copyright © 2016年 医联通. All rights reserved.
//

#import "CBCustomFunctionView.h"

#define fontSize 15
#define viewH   40
#define imageViewH  30
#define lineImageH  imageViewH / 2

@implementation CBCustomFunctionView

- (void)createFunctionViewWithButtons:(NSArray *)arrayButtonNames withView:(UIView *)creatView
{
    
//    creatView.backgroundColor = [UIColor blackColor];
    //  宽度
    CGFloat wide;
    
    for (NSString *strName in arrayButtonNames) {
        wide += strName.length * fontSize + 5;
    }
    
    CGRect rect = creatView.frame;
    rect.size.width = wide + 2;
    rect.size.height = viewH;
    creatView.frame = rect;
    
    //  按钮图片
    UIImageView *myImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, rect.size.width, imageViewH)];
    myImageView.backgroundColor = [UIColor colorWithRed:0 green:179/255.0 blue:230/255.0 alpha:1.0];
    myImageView.layer.cornerRadius = 4.0f;
    myImageView.layer.masksToBounds = YES;
    [creatView addSubview:myImageView];
    
    CGFloat X = 1;
    //  添加按钮
    for (int i = 0; i < arrayButtonNames.count; i++) {
        NSString *strName = arrayButtonNames[i];
        
        CGFloat buttonW = strName.length * fontSize + 5;
        
        UIButton *functionButton = [[UIButton alloc] initWithFrame:CGRectMake(X, 0, buttonW, imageViewH)];
        functionButton.titleLabel.textAlignment = NSTextAlignmentCenter;
        functionButton.titleLabel.font = [UIFont systemFontOfSize:fontSize];
        [functionButton setTitle:strName forState:UIControlStateNormal];
        [functionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [functionButton addTarget:self action:@selector(functionButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [creatView addSubview:functionButton];
        
        X += buttonW;
        
        //  按钮后分割线
        if (i != arrayButtonNames.count - 1) {
            UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(X, (imageViewH - lineImageH) / 2.0, 1, lineImageH)];
            lineImageView.backgroundColor = [UIColor redColor];
            [creatView addSubview:lineImageView];
        }
    }
    
    //  下面的箭头图片
    UIImageView *bottomImageView = [[UIImageView alloc] initWithFrame:CGRectMake((rect.size.width - 10) / 2.0, imageViewH, 10, 10)];
    bottomImageView.backgroundColor = [UIColor greenColor];
    [creatView addSubview:bottomImageView];
}

/**
 *  按钮响应
 *
 *  @param sender 按钮对象
 */
- (void)functionButtonClicked:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(functionButtonClickedWithFunctionName:withSelectIndex:)]) {
        [self.delegate functionButtonClickedWithFunctionName:sender.titleLabel.text withSelectIndex:self.selectIndex];
    }
}


@end
