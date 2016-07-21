//
//  NSObject+Add.h
//  CodePart
//
//  Created by lxx on 16/7/12.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Add)
#pragma mark  ---  KVO
/**
 *  通过Block方式注册一个KVO, 通过该方式注册的KVO无需手动移除，其会在监听对象销毁的时候自动移除，所以后边的两个移除的方法基本无需使用。
 *
 
 
 */
- (void)addObserverBlockForKeyPath:(NSString*)keyPath block:(void(^)(id obj,id oldVal,id newVal))block;



- (void)removeObserverBlockForKeyPath:(NSString*)keyPath;

- (void)removeAllObserverBlocks;

- (void)addNotificationForName:(NSString*)name  block:(void(^)(NSNotification*notification))block;
- (void)removeNotificationForName:(NSString*)name;
- (void)removeAllNotification;
- (void)postNotificationWithName:(NSString*)name userInfo:(nullable NSDictionary*)userInfo;

@end
NS_ASSUME_NONNULL_END