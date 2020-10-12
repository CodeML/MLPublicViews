//
//  MLSquareView.h
//  iKnowschool
//
//  Created by apple on 2019/6/18.
//  Copyright © 2019 cassim. All rights reserved.
//

#import "MLBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MLSquareView : MLBaseView
@property (nonatomic, assign) NSInteger ver;
@property (nonatomic, assign) NSInteger hor;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) CGFloat viewWidth;
@property (nonatomic, assign) CGFloat viewHeight;
@property (nonatomic, assign) CGFloat margin_v;
@property (nonatomic, assign) CGFloat margin_h;
@property (nonatomic, copy) NSString *viewName;

@property (nonatomic, strong, readonly) NSArray *views;
@property (nonatomic, copy) void (^setupViews)(UIView *view, NSInteger index);

- (void)creatSubViews;
@end

NS_ASSUME_NONNULL_END
