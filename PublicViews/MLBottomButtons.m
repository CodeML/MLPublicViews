//
//  MLBottomButtons.m
//  Demo
//
//  Created by admin on 2020/9/10.
//  Copyright © 2020 admin. All rights reserved.
//

#import "MLBottomButtons.h"

@implementation MLBottomButtons

+ (instancetype)buttonWithTitles:(NSArray<NSString *> *)titles colors:(NSArray<UIColor *> *)colors target:(nonnull id)target action:(nonnull SEL)action {
    
    if (titles.count != colors.count) return MLBottomButtons.new;
    
    MLBottomButtons *bar = [[MLBottomButtons alloc] initWithFrame:CGRectMake(MARGIN_S, 0, SCREENW - MARGIN_M, 50)];
    
    CGFloat w = (bar.width_ml - (titles.count - 1) * MARGIN_S) / titles.count;
    for (NSInteger i = 0; i < titles.count; i++) {
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        btn.left_ml = i * (w + MARGIN_S);
        btn.width_ml = w;
        btn.height_ml = bar.height_ml;
        
        if ([colors[i] isEqualColor:UIColor.changeColor]) {
            [btn addLayoutFromColor:[UIColor hex:@"#5EC8A0"] toColor:UIColor.mainGreen];
        }else{
            btn.backgroundColor = colors[i];
        }
        
        [btn setTitle:titles[i] forState:(UIControlStateNormal)];
        btn.titleLabel.font = UIFont.FONT16;
        
        if (btn.backgroundColor == UIColor.whiteColor) {
            [btn setTitleColor:UIColor.black9 forState:(UIControlStateNormal)];
            [btn addBorder:UIColor.black9];
        }else{
            [btn addBorder:UIColor.clearColor];
        }
        
        btn.tag = i;
        [btn addTarget:target action:action];
        [bar addSubview:btn];
    }
    return bar;
}

- (NSArray *)buttons {
    return self.subviews;
}
@end
