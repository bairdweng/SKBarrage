//
//  ViewController.m
//  SKBarrage
//
//  Created by baird weng on 2020/1/5.
//  Copyright © 2020 baird weng. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake(0, 80, 100, 100);
    testBtn.backgroundColor = [UIColor redColor];
    [testBtn addTarget:self action:@selector(clickOntheTestBtn) forControlEvents:UIControlEventTouchUpInside];
    testBtn.center = self.view.center;
    [self.view addSubview:testBtn];
    // Do any additional setup after loading the view.
}

- (void)clickOntheTestBtn {
    TwoViewController *two = [[TwoViewController alloc]init];
    [self.navigationController pushViewController:two animated:YES];
}


@end
