//
//  TapStarView.h
//  CodePart
//
//  Created by lxx on 16/7/29.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol TapStarViewDelegate <NSObject>
@required
-(void)tapStarViewWithScore:(NSString*)score;
@end
@interface TapStarView : UIView
@property(nonatomic,weak)id<TapStarViewDelegate>delegate;
@end

