//
//  CustomLayer.m
//  HelloAnimation
//
//  Created by Shelin on 16/3/17.
//  Copyright © 2016年 GreatGate. All rights reserved.
//

#import "CustomLayer.h"

@implementation CustomLayer

- (void)drawInContext:(CGContextRef)ctx {
    
    CGContextSetRGBFillColor(ctx, 0.4, 0.7, 0.1, 1.0);
    
    CGContextSetRGBStrokeColor(ctx, 0.1, 0.5, 0.9, 1.0);    //边沿
    
    CGContextMoveToPoint(ctx, 50, 50);
    
    CGContextAddLineToPoint(ctx, 100, 50);
    
    CGContextAddLineToPoint(ctx, 100, 150);
    
    CGContextAddLineToPoint(ctx, 100, 150);
    
    CGContextAddLineToPoint(ctx, 150, 150);
    
    CGContextClosePath(ctx);
    
    
    CGContextDrawPath(ctx, kCGPathFillStroke);
}

@end
