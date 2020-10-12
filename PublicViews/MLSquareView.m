//
//  MLSquareView.m
//  iKnowschool
//
//  Created by apple on 2019/6/18.
//  Copyright © 2019 cassim. All rights reserved.
//

#import "MLSquareView.h"

@implementation MLSquareView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
       _hor = _ver = _margin_v = _margin_h = 0;
    }
    return self;
}

- (NSArray *)views {
    return self.subviews;
}

- (void)creatSubViews {
    [self removeAllSubView];

    CGFloat w = (self.width_ml - _margin_h * (_hor - 1)) / _hor;
    if (_viewWidth) {
        w = _viewWidth;
    }
    
    CGFloat h = (self.height_ml - _margin_v * (_ver - 1)) / _ver;
    
    if (!_ver) h = w;
    
    if (_viewHeight) {
        h = _viewHeight;
    }
    
    for (NSInteger i = 0; i < self.count; i++) {
        NSInteger hor = i % _hor;
        NSInteger ver = i / (_ver?:_hor);

        UIView *view = nil;
        
        if ([self.viewName isEqualToString:@"UIButton"]) {
            view = [UIButton buttonWithType:(UIButtonTypeCustom)];
        }else{
            Class c = NSClassFromString(self.viewName);
            view = c.new;
        }
        
        view.tag = i;
        view.frame = CGRectMake(hor * (w + _margin_h), ver * (h + _margin_v), w, h);
        [self addSubview:view];
        
        if (i == self.count - 1) {
            self.height_ml = view.bottom_ml;
        }
        
        if (self.setupViews) {
            self.setupViews(view, i);
        }
        
        
    }
}

@end
