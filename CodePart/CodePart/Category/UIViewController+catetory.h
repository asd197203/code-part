//
//  UIViewController+catetory.h
//  demo
//
//  Created by lxx on 16/4/5.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (catetory)
-(UIViewController*)pushViewController:(NSString *)ToView Param:(NSDictionary*)param;
-(UIViewController*)presentViewController:(NSString *)ToView Param:(NSDictionary*)param;
@property (weak,nonatomic) UIViewController* modalVC;
@end
