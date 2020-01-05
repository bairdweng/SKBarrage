//
//  TwoViewController.m
//  SKBarrage
//
//  Created by baird weng on 2020/1/5.
//  Copyright © 2020 baird weng. All rights reserved.
//

#import "TwoViewController.h"
#import "OCBarrage.h"
#import "SKPersonCell.h"
@interface TwoViewController () {
    
    int _barrageCount;
    
}
@property (nonatomic, strong) OCBarrageManager *barrageManager;

@end

@implementation TwoViewController
- (void)dealloc {
    NSLog(@"------------------%@",NSStringFromClass([self class]));
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpView];
    [self setToolView];
    // Do any additional setup after loading the view.
}
- (void)setUpView {
    self.barrageManager = [[OCBarrageManager alloc] init];
    [self.view addSubview:self.barrageManager.renderView];
    self.barrageManager.renderView.frame = CGRectMake(0.0, 100, self.view.frame.size.width, 400);
    self.barrageManager.renderView.backgroundColor = [UIColor redColor];
    self.barrageManager.renderView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}
// 初始化
- (void)setToolView {
      CGFloat originY = CGRectGetHeight(self.view.frame) - 50.0;
      UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
      [button setTitle:@"开始" forState:UIControlStateNormal];
      [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
      [button addTarget:self action:@selector(startBarrage) forControlEvents:UIControlEventTouchUpInside];
      button.frame= CGRectMake(0.0, originY, 50.0, 50.0);
      button.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
      [self.view addSubview:button];
      
      UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
      [button2 setTitle:@"暂停" forState:UIControlStateNormal];
      [button2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
      [button2 addTarget:self action:@selector(pasueBarrage) forControlEvents:UIControlEventTouchUpInside];
      button2.frame= CGRectMake(55.0, originY, 50.0, 50.0);
      button2.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
      [self.view addSubview:button2];
      
      UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
      [button3 setTitle:@"继续" forState:UIControlStateNormal];
      [button3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
      [button3 addTarget:self action:@selector(resumeBarrage) forControlEvents:UIControlEventTouchUpInside];
      button3.frame= CGRectMake(110.0, originY, 50.0, 50.0);
      button3.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
      [self.view addSubview:button3];
      
      UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
      [button4 setTitle:@"停止" forState:UIControlStateNormal];
      [button4 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
      [button4 addTarget:self action:@selector(stopBarrage) forControlEvents:UIControlEventTouchUpInside];
      button4.frame= CGRectMake(165.0, originY, 50.0, 50.0);
      button4.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
      [self.view addSubview:button4];
}
- (void)addNormalBarrage {
    [self updateTitle];
    OCBarrageTextDescriptor *textDescriptor = [[OCBarrageTextDescriptor alloc] init];
    // 弹幕点击事件
    textDescriptor.cellTouchedAction = ^(OCBarrageDescriptor *__weak descriptor, OCBarrageCell *__weak cell) {
           NSLog(@"弹幕的cell被点击啦======%@",cell);
       };
    textDescriptor.text = [NSString stringWithFormat:@"~欢迎全民超人大驾光临2~"];
    textDescriptor.textColor = [UIColor blackColor];
    textDescriptor.positionPriority = OCBarragePositionMiddle;
    textDescriptor.textFont = [UIFont systemFontOfSize:17.0];
    textDescriptor.strokeColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    textDescriptor.strokeWidth = -1;
    textDescriptor.animationDuration = arc4random()%5 + 5;
    textDescriptor.fixedSpeed = 20;
    textDescriptor.barrageCellClass = [SKPersonCell class];
    [self.barrageManager renderBarrageDescriptor:textDescriptor];
    [self performSelector:@selector(addNormalBarrage) withObject:nil afterDelay:1];
}
-(void)addBarrage {
    [self addNormalBarrage];
}
- (void)startBarrage {
    [self.barrageManager start];
    [self addBarrage];
}
- (void)updateTitle {
    NSInteger barrageCount = self.barrageManager.renderView.animatingCells.count;
    self.title = [NSString stringWithFormat:@"现在有 %ld 条弹幕", (unsigned long)barrageCount];
}

- (void)pasueBarrage {
    [self.barrageManager pause];
}

- (void)resumeBarrage {
    [self.barrageManager resume];
}

- (void)stopBarrage {
    [self.barrageManager stop];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(addBarrage) object:nil];
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(addNormalBarrage) object:nil];
}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
