//
//  OCESearchTableHeaderView.m
//  OpenCourse
//
//  Created by Oneself on 16/6/12.
//  Copyright © 2016年 CCUT. All rights reserved.
//

#import "OCESearchTableHeaderView.h"

@interface OCESearchTableHeaderView()

@property (nonatomic, weak) UIView *topView;
@property (nonatomic, weak) UILabel *titleView;
@property (nonatomic, weak) UIView *divider;

@end

extern const CGFloat AYLViewsMargin;

@implementation OCESearchTableHeaderView

- (instancetype)init {
    if (self = [super init]) {
        UIView *topView = [[UIView alloc] init];
        topView.backgroundColor = [UIColor ayl_systemTableViewBackgroundColor];
        _topView = topView;
        [self addSubview:topView];
        
        UILabel *titleView = [[UILabel alloc] init];
        titleView.text = @"热门搜索";
        _titleView = titleView;
        [self addSubview:titleView];
        
        AYLDivider *divider = [AYLDivider ayl_divider];
        _divider = divider;
        [self addSubview:divider];
        
        self.ayl_height = 50;
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat viewHeight = self.ayl_height;
    
    _topView.ayl_size = CGSizeMake(SCREEN_WIDTH, self.ayl_height / 5);
    
    CGFloat dividerX = AYLViewsMargin;
    CGFloat dividerW = _topView.ayl_width - 2 * dividerX;
    CGFloat dividerH = 0.5;
    CGFloat dividerY = viewHeight - dividerH;
    _divider.frame = CGRectMake(dividerX, dividerY, dividerW, dividerH);
    
    _titleView.frame = CGRectMake(dividerX, _topView.ayl_bottom, dividerW / 2, viewHeight - _topView.ayl_height - dividerH);
}

@end
