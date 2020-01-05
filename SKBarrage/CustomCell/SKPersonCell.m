//
//  SKPersonCell.m
//  SKBarrage
//
//  Created by baird weng on 2020/1/5.
//  Copyright © 2020 baird weng. All rights reserved.
//
#define ImageWidth 89.0
#define ImageHeight 57.0
#import "SKPersonCell.h"

@implementation SKPersonCell
- (instancetype)init {
    self = [super init];
    if (self) {
        [self addSubviews];
    }
    
    return self;
}

- (void)addSubviews {
    [self.testImageView setImage:[UIImage imageNamed:@"chaoren_left"]];
    [self addSubview:self.testImageView];
}
- (void)updateSubviewsData {
    [super updateSubviewsData];
    [self.testImageView setImage:[UIImage imageNamed:@"chaoren_left"]];
}
- (void)layoutContentSubviews {
    [super layoutContentSubviews];
    self.testImageView.frame = CGRectMake(0, 0, 40, 40);
    CGFloat middleImageViewW = CGRectGetWidth(self.textLabel.bounds);
    CGFloat middleImageViewH = 19;
    CGFloat middleImageViewX = CGRectGetMaxX(self.testImageView.bounds) + 10;
    self.middleView.frame = CGRectMake(middleImageViewX, 10, middleImageViewW, middleImageViewH);
    self.textLabel.center = self.middleView.center;
//    self.backgroundColor = [UIColor blueColor];
//    self.layer.cornerRadius = 5;
//    self.layer.borderWidth = 1;
//    self.layer.borderColor = [UIColor blackColor].CGColor;

}
//- (void)convertContentToImage {
//
//}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
- (void)convertContentToImage {
}
// 一定要实现该方法
- (void)removeSubViewsAndSublayers {
    //如果不要删除leftImageView, middleImageView, rightImageView, textLabel, 只需重写这个方法并留空就可以了.
    //比如: 你想在这个cell被点击的时候, 修改文本颜色
}

- (UIImageView *)testImageView {
    if (!_testImageView) {
        _testImageView = [[UIImageView alloc] init];
        _testImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _testImageView;
}
- (UIView *)middleView {
    if (!_middleView) {
        _middleView = [UIView new];
    }
    return _middleView;
}

@end
