//
//  XXQuestionHeaderView.h
//  Lecture
//
//  Created by 陈旭 on 16/1/10.
//  Copyright © 2016年 陈旭. All rights reserved.
//

#import <UIKit/UIKit.h>
@class XXQuestionHeaderView;

@protocol XXQuestionHeaderViewDelegate <NSObject>

@optional
- (void)questionHeaderView:(XXQuestionHeaderView *)headerView didClickPostQuestionBtn:(UIButton *)btn;
- (void)questionHeaderView:(XXQuestionHeaderView *)headerView didClickContractBtn:(UIButton *)btn;

@end
@interface XXQuestionHeaderView : UIView
@property (nonatomic, weak) id<XXQuestionHeaderViewDelegate> delegate;
@end
