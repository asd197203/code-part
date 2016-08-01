//
//  ViewController.m
//  CodePart
//
//  Created by lxx on 16/7/5.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "ViewController.h"
#import "StartView.h"
#import "NSObject+Add.h"
#import "People.h"
#import "TapStarView.h"
@interface ViewController ()<TapStarViewDelegate>
@property(nonatomic,strong)People *peo;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    StartView *starV = [[StartView  alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    [starV setValue:2.5 animation:YES];
    starV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:starV];
    TapStarView *tapView = [[TapStarView alloc]initWithFrame:CGRectMake(100, 200, 100, 20)];
    tapView.delegate = self;
    [self.view addSubview:tapView];
    _peo =[[ People alloc]init];
    [_peo addObserverBlockForKeyPath:@"name" block:^(id  _Nonnull obj, id  _Nonnull oldVal, id  _Nonnull newVal) {
        NSLog(@"name修改为 =%@",newVal);
        NSLog(@"adasd");
    }];
    [[NSNotificationCenter defaultCenter]addNotificationForName:@"XWTestNotificaton" block:^(NSNotification * _Nonnull notification) {
        NSLog(@"---%@",notification.userInfo);
    }];
}
-(void)tapStarViewWithScore:(NSString *)score
{
    NSLog(@"---%@",score);
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"XWTestNotificaton" object:nil userInfo:@{@"test" : @"1"}];
    static BOOL flag = NO;
    if (!flag) {
        _peo.name = @"wazrx";
        flag = YES;
    }else{
        _peo = nil;//objA 销毁的时候其绑定的KVO会自己移除
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
