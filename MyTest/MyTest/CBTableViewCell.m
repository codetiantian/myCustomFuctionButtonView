//
//  CBTableViewCell.m
//  MyTest
//
//  Created by 崔兵兵 on 16/3/30.
//  Copyright © 2016年 医联通. All rights reserved.
//

#import "CBTableViewCell.h"

@interface CBTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@end

@implementation CBTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.contentView.backgroundColor = [UIColor grayColor];
    
    
//    UILongPressGestureRecognizer *longPre = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressToDo:)];
//    longPre.minimumPressDuration = 1.0;
//    [self.contentView addGestureRecognizer:longPre];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//-(void)longPressToDo:(UILongPressGestureRecognizer *)gesture
//{
//    if (self.SelectCellBlock) {
//        self.SelectCellBlock(self.cellIndex);
//    }
//}

- (void)setCellWithStringValue:(NSString *)strName
{
    self.valueLabel.text = strName;
//    self.cellIndex = cellIndex;
}

@end
