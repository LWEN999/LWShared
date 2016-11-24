//
//  LWSharedView.m
//  LWShared
//
//  Created by bagtree on 16/11/24.
//  Copyright © 2016年 wen. All rights reserved.
//

#import "LWSharedView.h"
#import "LWSharedButton.h"

#define ITEM_MAX_WIDTH 55
#define ITEM_MAX_HEIGHT 75
#define S_HEIGHTRATIO  [UIScreen mainScreen].bounds.size.height / 667.0
@interface LWSharedView ()
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) LWSharedButton *FriedsBtn;
@property (nonatomic, strong) LWSharedButton *weiXinBtn;
@property (nonatomic, strong) LWSharedButton *qqBtn;
@property (nonatomic, strong) LWSharedButton *qzoneBtn;
@property (nonatomic, strong) LWSharedButton *weiBoBtn;

@end
@implementation LWSharedView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self initContentView];
    }
    return self;
}
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self initContentView];
    }
    return self;
}

#pragma mark - initView
-(void)initContentView{
    _bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo_background_1"]];
    
    _titleLab = [[UILabel alloc] init];
    _titleLab.font = [UIFont systemFontOfSize:17];
    _titleLab.textColor = [UIColor blackColor];
    _titleLab.text = @"分享到";
    _titleLab.textAlignment = NSTextAlignmentCenter;
    
    _FriedsBtn = [[LWSharedButton alloc] init];
    [_FriedsBtn setTitle:@"朋友圈" forState:UIControlStateNormal];
    [_FriedsBtn setImage:[UIImage imageNamed:@"photo_icon_1"] forState:UIControlStateNormal];
    [_FriedsBtn addTarget:self action:@selector(itemDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    _weiXinBtn = [[LWSharedButton alloc] init];
    [_weiXinBtn setTitle:@"微信" forState:UIControlStateNormal];
    [_weiXinBtn setImage:[UIImage imageNamed:@"photo_icon_5"] forState:UIControlStateNormal];
    [_weiXinBtn addTarget:self action:@selector(itemDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    _qqBtn = [[LWSharedButton alloc] init];
    [_qqBtn setTitle:@"QQ" forState:UIControlStateNormal];
    [_qqBtn setImage:[UIImage imageNamed:@"photo_icon_2"] forState:UIControlStateNormal];
    [_qqBtn addTarget:self action:@selector(itemDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    _qzoneBtn = [[LWSharedButton alloc] init];
    [_qzoneBtn setTitle:@"QQ空间" forState:UIControlStateNormal];
    [_qzoneBtn setImage:[UIImage imageNamed:@"photo_icon_4"] forState:UIControlStateNormal];
    [_qzoneBtn addTarget:self action:@selector(itemDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    _weiBoBtn = [[LWSharedButton alloc] init];
    [_weiBoBtn setTitle:@"微博" forState:UIControlStateNormal];
    [_weiBoBtn setImage:[UIImage imageNamed:@"photo_icon_3"] forState:UIControlStateNormal];
    [_weiBoBtn addTarget:self action:@selector(itemDidClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:_bgImageView];
    [self addSubview:_titleLab];
    [self addSubview:_FriedsBtn];
    [self addSubview:_weiXinBtn];
    [self addSubview:_qqBtn];
    [self addSubview:_qzoneBtn];
    [self addSubview:_weiBoBtn];
}

#pragma mark - animation
-(void)animationShow{
    
    _bgImageView.frame = self.bounds;
    _titleLab.frame = CGRectMake((self.bounds.size.width - 70)*0.5,219*S_HEIGHTRATIO,70,20);
    _bgImageView.alpha = 0;
    _titleLab.alpha = 0;
    
    CGFloat spaceWidth = (self.frame.size.width - 45*2 - ITEM_MAX_WIDTH*3)/2;
    CGRect friedsFrame = CGRectMake(45,CGRectGetMaxY(_titleLab.frame)+80*S_HEIGHTRATIO,ITEM_MAX_WIDTH, ITEM_MAX_HEIGHT);
    CGRect weiXinFrame = CGRectMake(CGRectGetMaxX(friedsFrame)+spaceWidth,friedsFrame.origin.y,ITEM_MAX_WIDTH,ITEM_MAX_HEIGHT);
    
    CGRect qqFrame = CGRectMake(CGRectGetMaxX(weiXinFrame)+spaceWidth,friedsFrame.origin.y, ITEM_MAX_WIDTH, ITEM_MAX_HEIGHT);
    
    
    CGRect qzoneFrame = CGRectMake(100,CGRectGetMaxY(friedsFrame)+44*S_HEIGHTRATIO,ITEM_MAX_WIDTH, ITEM_MAX_HEIGHT);
    
    CGRect weiBoFrame = CGRectMake(CGRectGetMaxX(qzoneFrame)+spaceWidth,qzoneFrame.origin.y,ITEM_MAX_WIDTH,ITEM_MAX_HEIGHT);
    
    CGFloat moveY = self.frame.size.height - friedsFrame.origin.y;
    _FriedsBtn.frame = CGRectOffset(friedsFrame, 0, moveY);
    _weiXinBtn.frame = CGRectOffset(weiXinFrame, 0, moveY);
    _qqBtn.frame = CGRectOffset(qqFrame, 0, moveY);
    _qzoneBtn.frame = CGRectOffset(qzoneFrame, 0, moveY);
    _weiBoBtn.frame = CGRectOffset(weiBoFrame, 0, moveY);
    
    _FriedsBtn.alpha = 0;
    _weiXinBtn.alpha = 0;
    _qqBtn.alpha = 0;
    _qzoneBtn.alpha = 0;
    _weiBoBtn.alpha = 0;
    
    [UIView animateWithDuration:0.4 animations:^{
        _bgImageView.alpha = 1.0f;
        _titleLab.alpha = 1.0f;
    }];
    
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _FriedsBtn.frame = friedsFrame;
        _FriedsBtn.alpha = 1.0f;
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.05 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _weiXinBtn.frame = weiXinFrame;
        _weiXinBtn.alpha = 1.0f;
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.1 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _qqBtn.frame = qqFrame;
        _qqBtn.alpha = 1.0f;
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.15 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _qzoneBtn.frame =qzoneFrame;
        _qzoneBtn.alpha = 1.0f;
        
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.2 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _weiBoBtn.frame = weiBoFrame;
        _weiBoBtn.alpha = 1.0;
    } completion:nil];
}

-(void)dismiss{
    
    CGFloat moveY = self.frame.size.height - _FriedsBtn.frame.origin.y;
    
    [UIView animateWithDuration:0.4 animations:^{
        _bgImageView.alpha = 0;
        _titleLab.alpha = 0;
    }];
    
    
    [UIView animateWithDuration:0.5 delay:0.2 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _FriedsBtn.frame = CGRectOffset(_FriedsBtn.frame, 0, moveY);
        _FriedsBtn.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
    
    [UIView animateWithDuration:0.5 delay:0.15 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _weiXinBtn.frame = CGRectOffset(_weiXinBtn.frame, 0, moveY);
        _weiXinBtn.alpha = 0;
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.1 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _qqBtn.frame = CGRectOffset(_qqBtn.frame, 0, moveY);
        _qqBtn.alpha = 0;
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0.05 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _qzoneBtn.frame = CGRectOffset(_qzoneBtn.frame, 0, moveY);
        _qzoneBtn.alpha = 0;
        
    } completion:nil];
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _weiBoBtn.frame = CGRectOffset(_weiBoBtn.frame, 0, moveY);
        _weiBoBtn.alpha = 0;
    } completion:nil];
    
}


+(void)show:(id<LWSharedViewDelegate>)delegate {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    LWSharedView *sharedV = [[LWSharedView alloc] initWithFrame:window.bounds];
    sharedV.delegate = delegate;
    [window addSubview:sharedV];
    [sharedV animationShow];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismiss];
}

#pragma mark - UI事件
-(void)itemDidClicked:(UIButton *)btn{
    [self dismiss];
    if (!_delegate || ![_delegate respondsToSelector:@selector(sharedView:didClickedItem:)]) {
        return;
    }
    
    if (btn == _FriedsBtn) {
        [_delegate sharedView:self didClickedItem:0];
    }
    else if (btn == _weiXinBtn){
        [_delegate sharedView:self didClickedItem:1];
        
    }
    else if (btn == _qqBtn){
        [_delegate sharedView:self didClickedItem:2];
        
    }
    else if (btn == _qzoneBtn){
        [_delegate sharedView:self didClickedItem:3];
        
    }
    else if (btn == _weiBoBtn){
        [_delegate sharedView:self didClickedItem:4];
        
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
