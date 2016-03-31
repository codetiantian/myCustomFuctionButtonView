//
//  CBView.h
//  MyTest
//
//  Created by 崔兵兵 on 16/3/30.
//  Copyright © 2016年 医联通. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CBViewClickedDelegate <NSObject>

- (void)didSelectRowWithIndexPath:(NSIndexPath *)index;

@end

@interface CBView : UIView

@property (strong, nonatomic) NSIndexPath *indexPath;
@property (weak, nonatomic) id<CBViewClickedDelegate> delegate;

- (IBAction)button1Clicked;
- (IBAction)button2Clicked;
- (IBAction)button3Clicked;
@end
