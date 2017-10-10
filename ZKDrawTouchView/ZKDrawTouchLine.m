//
//  ZKDrawTouchLine.m
//  ZKDrawTouchView
//
//  Created by pang on 2017/6/6.
//  Copyright © 2017年 zk. All rights reserved.
//

#import "ZKDrawTouchLine.h"

@implementation ZKDrawTouchLine

- (instancetype)init {
    if (self = [super init]) {
        _blendMode = kCGBlendModeNormal;
        _lineWidth = 20;
        _lineColor = [UIColor blackColor];
    }
    return self;
}

- (NSMutableArray *)points {
    if (_points == nil) {
        _points = [NSMutableArray new];
    }
    return _points;
}

- (void)lineWithContext:(CGContextRef)context {
    CGContextSetStrokeColorWithColor(context, [_lineColor CGColor]);
    CGContextSetLineWidth(context, _lineWidth);
    CGContextSetBlendMode(context, _blendMode);
    CGContextBeginPath(context);
    CGContextAddPath(context, _path);
    CGContextStrokePath(context);
}

@end
