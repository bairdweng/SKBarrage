//
//  PHRoomSharingBarrageView.m
//  PuhaLive
//
//  Created by baird weng on 2020/1/6.
//  Copyright © 2020 Lambert. All rights reserved.
//

#import "PHRoomSharingBarrageView.h"
#import "PHRoomSharingBarrageItemView.h"

@implementation PHRoomSharingBarrageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupSubView];
    }
    return self;
}

- (void)setupSubView {
    PHRoomSharingBarrageItemView *itemView = [[PHRoomSharingBarrageItemView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    itemView.backgroundColor = [UIColor redColor];
    [self addSubview:itemView];
    [itemView addAnimation];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self setupSubView];
    });
}

@end
