//
//  ZKDrawTouchLine.h
//  ZKDrawTouchView
//
//  Created by pang on 2017/6/6.
//  Copyright © 2017年 zk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZKDrawTouchLine : NSObject

@property (nonatomic) CGMutablePathRef path;
@property (nonatomic) CGBlendMode blendMode;
@property (nonatomic) CGFloat lineWidth;      //线宽
@property (nonatomic,strong) UIColor *lineColor; //线条颜色


- (void)lineWithContext:(CGContextRef)context;
@end
