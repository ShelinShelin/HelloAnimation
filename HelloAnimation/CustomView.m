//
//  CustomView.m
//  HelloAnimation
//
//  Created by Shelin on 16/3/17.
//  Copyright © 2016年 GreatGate. All rights reserved.
//

#import "CustomView.h"
#import "CustomLayer.h"

@implementation CustomView

- (instancetype)initWithFrame:(CGRect)frame {
    if ([super initWithFrame:frame]) {
        CustomLayer *layer = [CustomLayer layer];
        layer.backgroundColor = [UIColor orangeColor].CGColor;
        layer.bounds = CGRectMake(0, 0, 200, 200);
        layer.position = CGPointMake(100,100);
        [layer setNeedsDisplay];
        [self.layer addSublayer:layer];
    }
    return self;
}

@end
