//
//  ViewController.m
//  HelloAnimation
//
//  Created by Shelin on 16/3/17.
//  Copyright © 2016年 GreatGate. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *animationView;

@property (nonatomic, strong) CALayer *animationLayer;

@property (nonatomic, strong) CALayer *layer;


@end

@implementation ViewController

- (UIView *)animationView {
    if (!_animationView) {
        _animationView = [[UIView alloc] init];
        _animationView.backgroundColor = [UIColor orangeColor];
    }
    return _animationView;
}

- (CALayer *)animationLayer {
    if (!_animationLayer) {
        _animationLayer = [CALayer layer];
        _animationLayer.backgroundColor = [UIColor orangeColor].CGColor;
        _animationLayer.masksToBounds = YES;
    }
    return _animationLayer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.animationLayer.position = self.view.center;
//    self.animationLayer.bounds = CGRectMake(0, 0, 150, 150);
//    self.animationLayer.delegate = self;
    
//    UIImage *image = [UIImage imageNamed:@"app_icon"];
//    [self.animationLayer setContents:(id)image.CGImage];
    
//    [self.view.layer addSublayer:self.animationLayer];
//    
//    [self.animationLayer setNeedsDisplay];
    
    
//====================================================
    
    
//    CustomView *customView = [[CustomView alloc] init];
//    customView.backgroundColor = [UIColor redColor];
//    customView.frame = CGRectMake(0, 0, 400, 400);
//    
//    [self.view addSubview:customView];
    

//====================================================
    
    CALayer *layer = [[CALayer alloc]init];
    layer.bounds = CGRectMake(0, 0, 10, 20);
    layer.position = CGPointMake(50, 150);
    layer.anchorPoint = CGPointMake(0.5, 0.6);
    layer.contents = (id)[UIImage imageNamed:@"app_icon"].CGImage;
    [self.view.layer addSublayer:layer];
    self.layer = layer;
}

//平移动画
- (void)translatonAnimation:(CGPoint)location {
    //设置执行动画，需要改变的属性
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    //属性起始值，也可不设置，则为默认值
//    basicAnimation.fromValue = [NSNumber numberWithInt:50];
    //属性结束值
    basicAnimation.toValue = [NSValue valueWithCGPoint:location];
    //动画时间
    basicAnimation.duration = 3.0f;
    //设置重复次数
//    basicAnimation.repeatCount = HUGE_VALF;
    
//    basicAnimation.fillMode=kCAFillModeForwards;
//    //上下二者同时设置，停留在动画结束时位置
//    basicAnimation.removedOnCompletion = NO;
    
    basicAnimation.delegate = self;
    
    //存储位置
    [basicAnimation setValue:[NSValue valueWithCGPoint:location] forKey:@"basicAnimation"];
    
    [self.layer addAnimation:basicAnimation forKey:@"basicAnimation"];
}

//旋转动画
-(void)rotationAnimation {
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    basicAnimation.toValue=[NSNumber numberWithFloat:M_PI_2 * 3];
    basicAnimation.repeatCount = HUGE_VALF;
    basicAnimation.duration = 6.0;
    basicAnimation.autoreverses = YES;//旋转后再旋转到原来的位置
    
    [_layer addAnimation:basicAnimation forKey:@"basicAnimation_Rotation"];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    self.animationLayer.bounds = CGRectMake(0, 0, 300, 300);
    UITouch *touch = touches.anyObject;
    CGPoint location= [touch locationInView:self.view];
    
    [self translatonAnimation:location];
    
    [self rotationAnimation];
}

#pragma mark = animation delegate

- (void)animationDidStart:(CAAnimation *)anim {
    NSLog(@"animationDidStart");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"animationDidStop");
    
    if (flag) {
        //开启事务
        [CATransaction begin];
        //禁用隐式动画
        [CATransaction setDisableActions:YES];
    
        self.layer.position = [[anim valueForKey:@"basicAnimation"] CGPointValue];
        
        //提交事务
        [CATransaction commit];
    }
}


- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    
    CGContextSaveGState(ctx);
    
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -150);
    
    UIImage *image = [UIImage imageNamed:@"app_icon"];
    
    CGContextDrawImage(ctx, CGRectMake(0, 0, 150, 150), image.CGImage);
    
    CGContextRestoreGState(ctx);
    
}

@end
