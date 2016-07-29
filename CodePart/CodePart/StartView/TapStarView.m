//
//  TapStarView.m
//  CodePart
//
//  Created by lxx on 16/7/29.
//  Copyright © 2016年 lxx. All rights reserved.
//

#import "TapStarView.h"
#define WIDTH self.frame.size.width
#define HEIGHT self.frame.size.height
static NSInteger accountV = 5;
@interface TapStarView()
@property(nonatomic,strong)UIView  *grayStarView;
@property(nonatomic,strong)UIView  *lightStarView;
@end
@implementation TapStarView
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
       [self setUpViews];
    }
    return  self;
}

-(void)setUpViews{
    self.grayStarView = [self setGrayStarViewAndlightStarViewBackImage:[UIImage imageNamed:@"star_gray"]];
    self.lightStarView = [self setGrayStarViewAndlightStarViewBackImage:[UIImage imageNamed:@"star_orange"]];
    [self addSubview:self.grayStarView];
}
-(UIView*)setGrayStarViewAndlightStarViewBackImage:(UIImage*)image
{
    UIView *view = [[UIView alloc]initWithFrame:self.bounds];
    view.clipsToBounds = YES;
        for (int i= 0; i<accountV; i++)
        {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i*WIDTH/accountV, 0, WIDTH/accountV, HEIGHT)];
            imageView.image = image;
            [view addSubview:imageView];
        }
    return view;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
     CGRect rect =   CGRectMake(0, 0, WIDTH, HEIGHT);
    if (CGRectContainsPoint(rect, point)) {
        [self changeStarStateWithPoint:point];
    }
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    __weak typeof (&*self)weakSelf = self;
    [UIView animateWithDuration:0.4 animations:^{
        [weakSelf changeStarStateWithPoint:point];
    } completion:nil];
}
-(void)changeStarStateWithPoint:(CGPoint)point
{
    CGPoint  touchPoint = point;
    if (touchPoint.x<0) {
        touchPoint.x=0;
    }
    if (touchPoint.x>WIDTH) {
        touchPoint.x=WIDTH;
    }
    CGFloat index = WIDTH/5;
    NSString *score = [NSString stringWithFormat:@"%.2f",touchPoint.x/index];
    [self.lightStarView removeFromSuperview];
    self.lightStarView.frame = CGRectMake(0, 0, touchPoint.x, HEIGHT);
    [self addSubview:self.lightStarView];
    if ([self.delegate respondsToSelector:@selector(tapStarViewWithScore:)]) {
        [self.delegate tapStarViewWithScore:score];
    }
}
@end
