//
//  CBTableViewCell.h
//  MyTest
//
//  Created by 崔兵兵 on 16/3/30.
//  Copyright © 2016年 医联通. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CBTableViewCell : UITableViewCell

//@property (strong, nonatomic) NSIndexPath *cellIndex;

/**
 *  赋值
 *
 *  @param strName 值
 */
- (void)setCellWithStringValue:(NSString *)strNamex;


//@property (copy, nonatomic) void (^SelectCellBlock)(NSIndexPath *selectIndex);

@end
