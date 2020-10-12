//
//  MLPresentView.m
//  iKnowschool
//
//  Created by apple on 2019/5/27.
//  Copyright © 2019 cassim. All rights reserved.
//

#import "MLPresentView.h"

@interface MLPresentView ()
@property (nonatomic, strong) UIView *cover;
@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIView *topBar;

@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation MLPresentView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:SCREEN_BOUNDS]) {
        [self addSubview:self.cover];
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    
    _titleLabel.text = title;
    [_titleLabel sizeToFit];
    _titleLabel.center = CGPointMake(SCREENW * 0.5, CELLH * 0.5);
}

- (void)setCustomView:(UIView *)customView {
    _customView = customView;
    
    customView.top_ml = self.topBar.bottom_ml;
    [_backView addSubview:customView];
    
    _backView.height_ml = customView.bottom_ml + BOTTOM_SAFE_H;
}

- (void)show {
    if (!_customView) return;
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    [UIView animateWithDuration:0.27 animations:^{
        self.cover.backgroundColor = UIColor.shadowColor;
        self.backView.top_ml = SCREENH - self.backView.height_ml;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)dismiss {
    [UIView animateWithDuration:0.27 animations:^{
        self.cover.backgroundColor = UIColor.clearColor;
        self.backView.top_ml = SCREENH;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)btnClick {
    if (self.rightButtonClick) {
        self.rightButtonClick();
    }
    [self dismiss];
}

- (void)nothing{}

#pragma mark - lazy
- (UIView *)cover {
    if (!_cover) {
        _cover = [[UIView alloc] initWithFrame:self.bounds];
        _cover.backgroundColor = UIColor.clearColor;
        [_cover addTarget:self action:@selector(dismiss)];
        [_cover addSubview:self.backView];
    }
    return _cover;
}

- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREENH, SCREENW, 0)];
        _backView.backgroundColor = UIColor.whiteColor;
        [_backView addTarget:self action:@selector(nothing)];
        [_backView addSubview:self.topBar];
    }
    return _backView;
}

- (UIView *)topBar {
    if (!_topBar) {
        _topBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENW, CELLH)];
        [_topBar addSubview:self.titleLabel];
        [_topBar addSubview:self.leftBtn];
        [_topBar addSubview:self.rightBtn];
        [_topBar addBottomLineWithColor:UIColor.lineColor];
    }
    return _topBar;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = UIColor.black3;
        _titleLabel.font = UIFont.FONT16;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

- (UIButton *)leftBtn {
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_leftBtn setTitleColor:UIColor.black6 forState:UIControlStateNormal];
        [_leftBtn.titleLabel setFont:UIFont.FONT14];
        [_leftBtn addTarget:self action:@selector(dismiss)];
        [_leftBtn sizeToFit];
        _leftBtn.left_ml = MARGIN_B;
        _leftBtn.centerY = CELLH * 0.5;
    }
    return _leftBtn;
}

- (UIButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBtn setTitle:@"完成" forState:UIControlStateNormal];
        [_rightBtn setTitleColor:UIColor.mainGreen forState:UIControlStateNormal];
        [_rightBtn.titleLabel setFont:UIFont.FONT14];
        [_rightBtn addTarget:self action:@selector(btnClick)];
        [_rightBtn sizeToFit];
        _rightBtn.right_ml = SCREENW - MARGIN_B;
        _rightBtn.centerY = CELLH * 0.5;
    }
    return _rightBtn;
}
@end
