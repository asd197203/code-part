//
//  StartView.m
//  CodePart
//
//  Created by lxx on 16/7/5.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "StartView.h"
static NSInteger kStartCount =5;
@interface StartView()
@property(nonatomic,strong)UIView   *bgGrayStartView;
@property(nonatomic,strong)UIView   *startView;
@end
@implementation StartView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.bgGrayStartView];
        [self addSubview:self.startView];
    }
    return self;
}
-(UIView*)bgGrayStartView{
    if (!_bgGrayStartView) {
        _bgGrayStartView = [[UIView alloc]initWithFrame:self.bounds];
        _bgGrayStartView.backgroundColor = [UIColor clearColor];
        [self setStarUpStars:_bgGrayStartView isBackGround:YES];
    }
    return _bgGrayStartView;
}
-(UIView*)startView
{
    if (!_startView) {
        _startView  = [[UIView alloc]initWithFrame:self.bounds];
        _startView.backgroundColor = [UIColor clearColor];
        _startView.clipsToBounds = YES;
        [self setStarUpStars:_startView isBackGround:NO];
    }
    return _startView;
}
-(void)setValue:(CGFloat)value animation:(BOOL)animation
{
    CGFloat perwidth = self.frame.size.width / kStartCount;
    CGRect frame = self.startView.frame;
    frame.size.width = perwidth * value;
    NSLog(@"frame.size.width===%f",frame.size.width);
    if (animation) {
        [UIView animateWithDuration:0.5 animations:^{
            self.startView.frame = frame;
        }];
    }
    else {
        self.startView.frame = frame;
    }
}
-(void)setStarUpStars:(UIView*)view isBackGround:(BOOL)isBackGround
{
    CGFloat w =view.frame.size.width/kStartCount;
    for (int i =0; i<kStartCount; i++) {
        UIImage *image = [UIImage imageNamed:isBackGround==YES?@"star_gray":@"star_orange"];
        CGRect rect = CGRectMake(w*i, 0, w, view.frame.size.height);
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:rect];
        imageview.image = image;
        imageview.contentMode =UIViewContentModeScaleAspectFit;
        [view addSubview:imageview];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
