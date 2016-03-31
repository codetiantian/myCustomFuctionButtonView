//
//  CBView.m
//  MyTest
//
//  Created by 崔兵兵 on 16/3/30.
//  Copyright © 2016年 医联通. All rights reserved.
//

#import "CBView.h"

@implementation CBView

- (IBAction)button1Clicked {
    NSLog(@"------按钮1点击");
    
    if ([self.delegate respondsToSelector:@selector(didSelectRowWithIndexPath:)]) {
        [self.delegate didSelectRowWithIndexPath:self.indexPath];
    }
    
}

- (IBAction)button2Clicked {
    NSLog(@"------按钮2点击");
    if ([self.delegate respondsToSelector:@selector(didSelectRowWithIndexPath:)]) {
        [self.delegate didSelectRowWithIndexPath:self.indexPath];
    }
}

- (IBAction)button3Clicked {
    NSLog(@"------按钮3点击");
    if ([self.delegate respondsToSelector:@selector(didSelectRowWithIndexPath:)]) {
        [self.delegate didSelectRowWithIndexPath:self.indexPath];
    }
}
@end
