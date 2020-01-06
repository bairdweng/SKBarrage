//
//  PHRoomSharingBarrageItemView.m
//  SKBarrage
//
//  Created by baird weng on 2020/1/6.
//  Copyright © 2020 baird weng. All rights reserved.
//
#define kBarrageAnimation @"kBarrageAnimation"

#import "PHRoomSharingBarrageItemView.h"
@implementation PHRoomSharingBarrageItemView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (void)addAnimation {
    if (!self.superview) {
        return;
    }
    CGPoint startCenter = CGPointMake(self.superview.frame.size.width + 100, self.center.y);
    CGPoint endCenter = CGPointMake(-200, self.center.y);
    CAKeyframeAnimation *walkAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    walkAnimation.values = @[[NSValue valueWithCGPoint:startCenter], [NSValue valueWithCGPoint:endCenter]];
    walkAnimation.keyTimes = @[@(0.0), @(1.0)];
    walkAnimation.duration = 4;
    walkAnimation.repeatCount = 1;
    walkAnimation.delegate =  self;
    walkAnimation.removedOnCompletion = NO;
    walkAnimation.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:walkAnimation forKey:kBarrageAnimation];
}
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    [self removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
