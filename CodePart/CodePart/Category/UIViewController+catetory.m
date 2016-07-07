//
//  UIViewController+catetory.m
//  demo
//
//  Created by lxx on 16/4/5.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "UIViewController+catetory.h"
#import <objc/runtime.h>
static const char g_charModalVC;
@implementation UIViewController (catetory)
-(UIViewController*)pushViewController:(NSString *)ToView Param:(NSDictionary*)param
{
    Class cls = NSClassFromString(ToView);
    id viewController = [[[cls class] alloc]init];
    if (param!=nil) {
        for (NSString*key in param) {
            id obj = param[key];
            [viewController setValue:obj forKey:key];
        }
    }
    ((UIViewController*)viewController).hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:viewController animated:YES];
    return  viewController;
}
-(UIViewController*)presentViewController:(NSString *)ToView Param:(NSDictionary*)param
{
    Class cls = NSClassFromString(ToView);
    id viewController = [[[cls class]alloc]init];
    if(!param)
    {
        for (NSString*key in param) {
            id obj =param[key];
            [viewController setValue:obj forKey:key];
        }
    }
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:viewController];
    [self presentViewController:nav animated:YES completion:nil];
    return viewController;
}
-(void)setModalVC:(UIViewController *)modalVC
{
    objc_setAssociatedObject(self, &g_charModalVC, modalVC, OBJC_ASSOCIATION_ASSIGN);
}

-(UIViewController*)modalVC
{
    return  objc_getAssociatedObject(self, &g_charModalVC);
}

@end
