//
//  SKPersonCell.h
//  SKBarrage
//
//  Created by baird weng on 2020/1/5.
//  Copyright © 2020 baird weng. All rights reserved.
//

#import "OCBarrageTextCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface SKPersonCell : OCBarrageTextCell
@property(nonatomic, strong)UIView *middleView;
@property (nonatomic, strong) UIImageView *testImageView;
@end

NS_ASSUME_NONNULL_END
