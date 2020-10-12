//
//  MLPresentView.h
//  iKnowschool
//
//  Created by apple on 2019/5/27.
//  Copyright © 2019 cassim. All rights reserved.
//

#import "MLBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MLPresentView : MLBaseView
@property (nonatomic, copy) void (^rightButtonClick)(void);
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIView *customView;

- (void)show;
@end

NS_ASSUME_NONNULL_END
