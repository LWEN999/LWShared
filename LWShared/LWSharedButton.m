//
//  LWSharedButton.m
//  LWShared
//
//  Created by bagtree on 16/11/24.
//  Copyright © 2016年 wen. All rights reserved.
//

#import "LWSharedButton.h"

@implementation LWSharedButton
-(instancetype)init{
    if (self = [super init]) {
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self setTitleColor:[UIColor colorWithRed:33/255.0 green:33/255.0 blue:33/255.0 alpha:1] forState:UIControlStateNormal];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake((self.frame.size.width - 55 )*0.5, 0, 55,55);
    self.titleLabel.frame = CGRectMake(0,CGRectGetMaxY(self.imageView.frame),self.frame.size.width, self.frame.size.height-55);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
