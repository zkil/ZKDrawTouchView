//
//  ZKDrawTouchView.m
//  ZKDrawTouchView
//
//  Created by pang on 2017/6/6.
//  Copyright © 2017年 zk. All rights reserved.
//

#import "ZKDrawTouchView.h"
#import "ZKDrawTouchLine.h"

@interface ZKDrawTouchView (){
    CGMutablePathRef _currentPath;
}



@end

@implementation ZKDrawTouchView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
}

- (void)setup {
    self.contentMode = UIViewContentModeRedraw;
    self.backgroundColor = [UIColor whiteColor];
    _lines = [NSMutableArray new];
    _currentLineWidth = 5;
    _currentLineColor = [UIColor blackColor];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _currentPath = CGPathCreateMutable();
    ZKDrawTouchLine *line = [ZKDrawTouchLine new];
    line.path = _currentPath;
    line.lineWidth = self.currentLineWidth;
    line.lineColor = self.currentLineColor;
    [self.lines addObject:line];
    
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    CGPathMoveToPoint(_currentPath, NULL, point.x, point.y);
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    CGPathAddLineToPoint(_currentPath, NULL, point.x, point.y);
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (ZKDrawTouchLine *line in self.lines) {
        [line lineWithContext:context];
    }
}



/** 清屏 */
- (void)clearScreen {
    [_lines removeAllObjects];
    [self setNeedsDisplay];
}

/** 撤消操作 */
- (void)revoke {
    [_lines removeLastObject];
    [self setNeedsDisplay];
}

- (UIImage *)imageWithDraw {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size,YES,self.layer.contentsScale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)dealloc {
    [self.lines enumerateObjectsUsingBlock:^(ZKDrawTouchLine *line, NSUInteger idx, BOOL * _Nonnull stop) {
        CGPathRelease(line.path);
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
