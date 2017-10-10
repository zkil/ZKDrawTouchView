//
//  ZKDrawTouchView.h
//  ZKDrawTouchView
//
//  Created by pang on 2017/6/6.
//  Copyright © 2017年 zk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZKDrawTouchView : UIView
@property (nonatomic,strong) NSMutableArray *lines;

@property (nonatomic,strong) UIColor *currentLineColor;
@property (nonatomic) CGFloat currentLineWidth;

- (void)clearScreen;
- (void)revoke;

- (UIImage *)imageWithDraw;
@end
