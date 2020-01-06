//
//  PHRoomAwardShareItemView.m
//  SKBarrage
//
//  Created by baird weng on 2020/1/6.
//  Copyright © 2020 baird weng. All rights reserved.
//

#import "PHRoomAwardShareItemView.h"

@interface PHRoomAwardShareItemView ()
/// 用于映射textLabel的frame
@property(nonatomic,strong) UIView *middleView;
/// 头像
@property(nonatomic,strong) UIImageView *faceImageView;

@property(nonatomic,strong)UIView *contentView;
@end


@implementation PHRoomAwardShareItemView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setupView];
    }
    
    return self;
}

- (void)setupView {
    [self addSubview:self.contentView];
    [self addSubview:self.middleView];
    [self addSubview:self.faceImageView];
}

- (void)updateSubviewsData {
    [super updateSubviewsData];
    
}
- (void)layoutContentSubviews {
    [super layoutContentSubviews];
    
    self.contentView.backgroundColor = [UIColor yellowColor];
    self.contentView.layer.cornerRadius = 10;
    
    self.faceImageView.frame = CGRectMake(10, 0, 16, 16);
    self.faceImageView.layer.cornerRadius = 8;
    self.faceImageView.backgroundColor = [UIColor blueColor];
    self.faceImageView.layer.masksToBounds = YES;
    CGFloat middleImageViewW = CGRectGetWidth(self.textLabel.bounds)+10;
    CGFloat middleImageViewH = 30;
    CGFloat middleImageViewX = CGRectGetMaxX(self.faceImageView.bounds) + 10;
    self.middleView.frame = CGRectMake(middleImageViewX, 0, middleImageViewW, middleImageViewH);
    
    self.textLabel.center = self.middleView.center;
    self.textLabel.backgroundColor = [UIColor greenColor];
    
    self.faceImageView.center = CGPointMake(self.faceImageView.center.x, self.middleView.center.y);
    
    self.contentView.frame = CGRectMake(0, 5, middleImageViewW+self.faceImageView.frame.origin.x+self.faceImageView.frame.size.width, 20);
}
- (UIImageView *)faceImageView {
    if (!_faceImageView) {
        _faceImageView = [UIImageView new];
        _faceImageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _faceImageView;
}

- (UIView *)middleView {
    if (!_middleView) {
        _middleView = [UIView new];
    }
    return _middleView;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView new];
    }
    return _contentView;
}
- (void)convertContentToImage {
}
// 必须实现该方法
- (void)removeSubViewsAndSublayers {
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
