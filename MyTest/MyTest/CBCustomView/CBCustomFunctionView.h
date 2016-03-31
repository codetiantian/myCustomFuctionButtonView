//
//  CBCustomFunctionView.h
//  MyTest
//
//  Created by 崔兵兵 on 16/3/31.
//  Copyright © 2016年 医联通. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CBCustomFunctionViewDelegate <NSObject>

/**
 *  功能按钮点击协议方法
 *
 *  @param functionName 功能名称
 */
- (void)functionButtonClickedWithFunctionName:(NSString *)functionName withSelectIndex:(NSIndexPath *)selectIndex;

@end

@interface CBCustomFunctionView : UIView


@property (weak, nonatomic) id<CBCustomFunctionViewDelegate> delegate;

/**
 *  cell中选中的位置
 */
@property (strong, nonatomic) NSIndexPath *selectIndex;

/**
 *  创建按钮气泡
 *
 *  @param arrayButtonNames 按钮的名字数组
 *  @param creatView        CBCustomFunctionView对象
 */
- (void)createFunctionViewWithButtons:(NSArray *)arrayButtonNames withView:(UIView *)creatView;


@end
