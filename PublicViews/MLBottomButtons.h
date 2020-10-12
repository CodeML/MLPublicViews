//
//  MLBottomButtons.h
//  Demo
//
//  Created by admin on 2020/9/10.
//  Copyright © 2020 admin. All rights reserved.
//

#import "MLBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MLBottomButtons : MLBaseView
@property (nonatomic, strong, readonly) NSArray *buttons;

+ (instancetype)buttonWithTitles:(NSArray <NSString *>*)titles colors:(NSArray <UIColor *>*)colors target:(id)target action:(SEL)action;
@end

NS_ASSUME_NONNULL_END
