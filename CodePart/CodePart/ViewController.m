//
//  ViewController.m
//  CodePart
//
//  Created by lxx on 16/7/5.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "ViewController.h"
#import "StartView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    StartView *starV = [[StartView  alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    [starV setValue:2.5 animation:YES];
    starV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:starV];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
